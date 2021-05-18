module engine.memory;

import std.format: format;
import engine.carts.cart;
import data;
// import std.bitmanip: BitArray;





enum FBit : ubyte 
{
    Z = 0b1000_0000,
    N = 0b0100_0000,
    H = 0b0010_0000,
    C = 0b0001_0000,
}


enum Flag : int  {
    Z  = 7,
    N  = 6,
    H  = 5,
    Cy = 4,
    NZ = 8 | 7,
    NC = 8 | 4, 
}

enum Reg8 : int {
    A,F,
    B,C,
    D,E,
    H,L,
}

enum Reg16 : int {
    AF,
    BC,
    DE,
    HL,
}


align(1)
struct GameBoyCPUState {
    union {
        ubyte[8] reg8;
        // struct {
        //     ubyte rA;
        //     ubyte rF;
        //     ubyte rB;
        //     ubyte rC;
        //     ubyte rD;
        //     ubyte rE;
        //     ubyte rH;
        //     ubyte rL;
        // }
        Data2[4] reg16;
        // struct {
        //     ushort rAF;
        //     ushort rBC;
        //     ushort rDE;
        //     ushort rHL;
        // }
        struct {
            ubyte accum;
            Flag8 flag;
        }
    }
    Data2 programCounter;
    Data2 stackPointer;

    bool imeFlag = 0;

    // bool[4] flag;


    void setFlags(ubyte mask_flags) {
        foreach (i; 0..4) {
            if (mask_flags&(0b1_0000<<i)) {
                flag[i] = (mask_flags >> i) & 1;
            }   
        }
    }


    // bool readFlag(Flag f) {
    //     return flag[f&3] ^ cast(bool) (f>>2);
    // }
    

    // void writeFlag(Flag f, bool val) {
    //     flag[f&3] = val;
    //     reg8[1] = flag[0]<<7 | flag[1]<<6 | flag[2]<<5 | flag[3]<<4;
    // }

    void Cy(bool val) {flag[Flag.Cy] = val;}
    bool Cy() {return flag[Flag.Cy];}


    // bool readRegister8(Reg8 reg) {
    //     return reg8[reg];
    // }


    // bool writeRegister(Flag flag) {
    //     return 0;
    // }

}



// /*
align(1)
struct GameBoyMemoryState {
    Cart cart;
    auto vram  = new BankSet!0x4000(1);
    auto wram  = new BankSet!0x1000(2, 1);
    auto oam   = new BankSet!0xA0();
    auto ioReg = new BankSet!0x80();
    auto hram  = new BankSet!0x7F();
    ubyte ieReg;


    enum READ_WRITE = q{
        if      (address.u16 < 0x4000) {%s} /// bank slot 1
        else if (address.u16 < 0x8000) {%s} /// bank slot 2
        else if (address.u16 < 0xA000) {%s} /// Video RAM
        else if (address.u16 < 0xC000) {%s} /// RAM bank slot
        else if (address.u16 < 0xD000) {%s} /// Work RAM 1
        else if (address.u16 < 0xE000) {%s} /// Work RAM 2 / WRAM Bank slot
        else if (address.u16 < 0xFE00) {%s} /// Mirror of WRAM
        else if (address.u16 < 0xFEA0) {%s} /// OAM (Sprite attributes)
        else if (address.u16 < 0xFF00) {%s} /// Invalid
        else if (address.u16 < 0xFF80) {%s} /// I/O
        else if (address.u16 < 0xFFFF) {%s} /// High RAM ?????
        else {%s} /// Interrupts Enable Register (IE)
    };


    ubyte read(Data2 address) {
        import std.format: format;
        mixin(format!READ_WRITE(
            q{return cart.read(address.u16);}, /// bank slot 1
            q{return cart.read(address.u16);}, /// bank slot 2
            q{return vram.currentBank[address.u16-0x8000];}, /// Video RAM
            q{return cart.read(address.u16);}, /// RAM bank slot
            q{return wram.bank[0][address.u16-0xC000];}, /// Work RAM 1
            q{return wram.currentBank[address.u16-0xD000];}, /// Work RAM 2 / WRAM Bank slot
            q{assert(0);}, /// Mirror of WRAM
            q{return oam.bank[0][address.u16-0xFE00];}, /// OAM (Sprite attributes)
            q{assert(0);}, /// Invalid
            q{return ioReg.bank[0][address.u16-0xFF00];}, /// I/O
            q{return hram.bank[0][address.u16-0xFF80];}, /// High RAM ?????
            q{return ieReg;} /// Interrupts Enable Register (IE)
        ));
    }
    
    
    ubyte write(Data2 address, ubyte val) {
        import std.format: format;
        mixin(format!READ_WRITE(
            q{cart.write(address.u16, val);}, /// bank slot 1
            q{cart.write(address.u16, val);}, /// bank slot 2
            q{vram.currentBank[address.u16-0x8000] = val;}, /// Video RAM
            q{cart.write(address.u16, val);}, /// RAM bank slot
            q{wram.bank[0][address.u16-0xC000] = val;}, /// Work RAM 1
            q{wram.currentBank[address.u16-0xD000] = val;}, /// Work RAM 2 / WRAM Bank slot
            q{assert(0);}, /// Mirror of WRAM
            q{oam.bank[0][address.u16-0xFE00] = val;}, /// OAM (Sprite attributes)
            q{assert(0);}, /// Invalid
            q{ioReg.bank[0][address.u16-0xFF00] = val;}, /// I/O
            q{hram.bank[0][address.u16-0xFF80] = val;}, /// High RAM ?????
            q{assert(0);} /// Interrupts Enable Register (IE)
        ));
        return val;
    }
}



