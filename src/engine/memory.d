module engine.memory;

import std.format: format;
import engine.carts.cart;
import data;
import std.stdio;

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
        Data2[4] reg16;
        struct {
            ubyte accum;
            Flag8 flag;
        }
    }
    Data2 programCounter;
    Data2 stackPointer;

    bool imeFlag = 0;
    

    this(string sytemType) {

    }


    void setFlags(ubyte mask_flags) {
        foreach (i; 0..4) {
            if (mask_flags&(0b1_0000<<i)) {
                flag[i] = (mask_flags >> i) & 1;
            }   
        }
    }

    // void Cy(bool val) {flag[Flag.Cy] = val;}
    // bool Cy() {return flag[Flag.Cy];}
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

    /// special memory registers
    ubyte ieReg;
    ubyte dividerReg;
    ubyte timerReg;
    ubyte timeModuloReg;
    ubyte timeControlReg;


    this(string romFileString) {
        cart = loadCart(romFileString);
    }


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
        mixin(format!READ_WRITE(
            /* bank slot 1 */ 
            q{cart.write(address.u16, val);},
            /* bank slot 2 */
            q{cart.write(address.u16, val);}, /// 
            /* Video RAM */
            q{vram.currentBank[address.u16-0x8000] = val;}, /// 
            /* RAM bank slot */
            q{cart.write(address.u16, val);}, /// 
            /* Work RAM 1 */
            q{wram.bank[0][address.u16-0xC000] = val;}, /// 
            /* Work RAM 2 / WRAM Bank slot */
            q{wram.currentBank[address.u16-0xD000] = val;}, /// 
            /* Mirror of WRAM */
            q{assert(0);}, /// 
            /* OAM (Sprite attributes) */
            q{oam.bank[0][address.u16-0xFE00] = val;}, /// 
            /* Invalid */
            q{assert(0);}, /// 
            /* I/O */
            q{ioReg.bank[0][address.u16-0xFF00] = val;}, /// 
            /* High RAM ????? */
            q{hram.bank[0][address.u16-0xFF80] = val;}, /// 
            /* Interrupts Enable Register (IE) */
            q{assert(0);} /// 
        ));
        return val;
    }
}



