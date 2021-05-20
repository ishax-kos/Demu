module engine.carts.cart;
import std.stdio;

public import engine.carts.boot;
public import engine.carts.nombc;
public import engine.carts.huc3;


/// Cartride type is stored at 0x0147 on the rom.
enum CartType:ubyte {
    NoMBC   =0x00,

    MBC1    =0x01,
    MBC1_RAM,
    MBC1_RAM_BATTERY,
    

    MBC2    =0x05,
    MBC2_BATTERY,

    ROM_RAM =0x08,
    ROM_RAM_BATTERY,

    MMM01   =0x0B,
    
    HuC3    =0xFE,
    HuC1_RAM_BATTERY
}


class Cart {
    abstract ubyte read(ushort address);
    abstract ubyte write(ushort address, ubyte value);

  protected:
    ubyte[0x4000][] rom;
    ubyte[0x2000][] ram;
}



Cart loadCart(string filename = "") {
    import std.exception:ErrnoException;
    
    if (filename == "") {
        return new CartBootROM();
    }

    File* file;
    try {
        file = new File(filename, "r");
        writeln("reading cart...");
    }
    catch(ErrnoException) {assert(0);}

    ubyte[0x4000] buffer;
    // file.seek(0x0147);
    file.rawRead(buffer);


    Cart cart;
    /// Cart Type
    switch (buffer[0x0147]) {
        case CartType.NoMBC: 
            cart = new CartNoMBC();
            writefln("Found Non-mbc cart ($%02X)", buffer[0x0147]);
            break;
        case CartType.HuC3: 
            cart = new CartHuC3();
            writefln("Found HuC-3 cart ($%02X)", buffer[0x0147]);
            break;
        default:
            assert(0);
    }

    int banks = 2 ^^ (buffer[0x0148]+1);
    writefln!"%s total ROM banks"(banks);
    cart.rom.length = banks; /// 0x4000 is half of 32 KB
    file.seek(0);
    foreach (i, bank; cart.rom) {
        assert(!file.eof());
        file.rawRead(cart.rom[i]);
    }
    writefln!"rom length %s"(cart.rom.length);
    readln();
    return cart;
}
