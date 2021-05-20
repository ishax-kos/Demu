module engine.carts.huc3;

import engine.carts.cart;
import std.stdio;



private
enum BankMode:bool {
    ROM,
    RAM
}


class CartHuC3 : Cart {
    
    override 
    ubyte read(ushort address) {
        writef!"read rom address $%04X"(address);
        if (address < 0x4000) {
            writefln!" %s"(romIndex0);
            return this.rom[romIndex0][address % 0x4000];
        }
        else if (address < 0x8000) {
            writefln!" %s"(romIndex1);
            auto bank = this.rom[romIndex1];
            return bank[address % 0x4000];
        }
        else if (address >= 0xA000 && address < 0xC000) {
            return this.ram[ramIndex][address % 0x2000];
        }
        assert(0);
    }


    override 
    ubyte write(ushort address, ubyte value) {
        return 0;
    }


  private:
    /// Bank Slot: rom 1, rom 2, ram 1
    size_t romIndex0 = 0;
    size_t romIndex1 = 1;
    size_t ramIndex = 0;


    void scheduleEvent() {
        version(Windows10) {
            import core.sys.windows.windows;
            /// push a callandar event
        }
    }
}

