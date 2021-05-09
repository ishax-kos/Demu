module demu.engine.memory;

import std.format: format;
import demu.engine.carts.cart;
import demu.data;

enum FBit
{
    Z = 0b1000_0000,
    N = 0b0100_0000,
    H = 0b0010_0000,
    C = 0b0001_0000,
}


enum Flag {
    Z,
    N,
    H,
    Cy,
    NZ = 0b0100,
    NC = 0b0111, 
}

enum Reg8 {
    A,F,
    B,C,
    D,E,
    H,L,
}

enum Reg16 {
    AF,
    BC,
    DE,
    HL,
}


align(1)
struct GameBoyCPUState {
    union {
        Data1[8] reg8;
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
    }
    ushort programCounter;
    ushort stackPointer;

    private bool[4] flag;


    bool readFlag(Flag f) {
        return flag[f&3] ^ cast(bool) (f>>2);
    }
    

    void writeFlag(Flag f, bool val) {
        flag[f&3] = val;
        reg8[1].u8 = flag[0]<<7 | flag[1]<<6 | flag[2]<<5 | flag[3]<<4;
    }

    void Cy(bool val) {writeFlag(Flag.Cy, val);}
    bool Cy() {return readFlag(Flag.Cy);}


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

    ubyte read(ushort address) {
        if (address < 0x4000) {
            return cart.read(address);
        }

        /// bank slot 2
        else if (address < 0x8000) {
            return cart.read(address);
        }
        
        /// Video RAM
        else if (address < 0xA000) {
            return vram.currentBank[address-0x8000];
        }

        /// RAM bank slot
        else if (address < 0xC000) {
            return cart.read(address);
        }

        /// Work RAM 1
        else if (address < 0xD000) {
            return wram.bank[0][address-0xC000];
        }

        /// Work RAM 2 / WRAM Bank slot
        else if (address < 0xE000) {
            return wram.currentBank[address-0xD000];
        }

        /// Mirror of WRAM
        else if (address < 0xFE00) {
            assert(0);
        }

        /// OAM (Sprite attributes)
        else if (address < 0xFEA0) {
            return oam.bank[0][address-0xFE00];
        }

        /// Invalid
        else if (address < 0xFF00) {
            assert(0);
        }

        /// I/O
        else if (address < 0xFF80) {
            return ioReg.bank[0][address-0xFF00];
        }

        /// High RAM ?????
        else if (address < 0xFFFF) {
            return hram.bank[0][address-0xFF80];
        }

        /// Interrupts Enable Register (IE)
        else { // address == 0xFFFF
            return ieReg;
        }
    }

    // static immutable offsets [0x4000, 0x8000, 0xA000, 0xC000, 0xD000, 0xE000, 0xFE00, 0xFEA0, 0xFEA0, 0xFF00, 0xFF80, 0xFFFF];
    // static immutable sources [0x4000, 0x8000, 0xA000, 0xC000, 0xD000, 0xE000, 0xFE00, 0xFEA0, 0xFEA0, 0xFF00, 0xFF80, 0xFFFF];

    // void write(ushort address, ubyte offsets) {
    //     static foreach (offset; [0x4000, 0x8000, 0xA000, 0xC000, 0xD000, 0xE000, 0xFE00, 0xFEA0, 0xFEA0, 0xFF00, 0xFF80, 0xFFFF]) {
    //         mixin("else if (address < %s) {
    //             %s.write
    //             return;
    //         }".format(offset, source));
    //     }
    // }
    
    
    private void write(ushort address, ubyte val) {
        if (address < 0x4000) {
            cart.write(address, val);
            return;
        }

        /// bank slot 2
        else if (address < 0x8000) {
            cart.write(address, val);
            return;
        }
        
        /// Video RAM
        else if (address < 0xA000) {
            vram.currentBank[address-0x8000] = val;
            return;
        }

        /// RAM bank slot
        else if (address < 0xC000) {
            cart.write(address, val);
            return;
        }

        /// Work RAM 1
        else if (address < 0xD000) {
            wram.bank[0][address-0xC000] = val;
            return;
        }

        /// Work RAM 2 / WRAM Bank slot
        else if (address < 0xE000) {
            wram.currentBank[address-0xD000] = val;
            return;
        }

        /// Mirror of WRAM
        else if (address < 0xFE00) {
            assert(0);
        }

        /// OAM (Sprite attributes)
        else if (address < 0xFEA0) {
            oam.bank[0][address-0xFE00] = val;
            return;
        }

        /// Invalid
        else if (address < 0xFF00) {
            assert(0);
        }

        /// I/O
        else if (address < 0xFF80) {
            ioReg.bank[0][address-0xFF00] = val;
            return;
        }

        /// High RAM ?????
        else if (address < 0xFFFF) {
            hram.bank[0][address-0xFF80] = val;
            return;
        }

        /// Interrupts Enable Register (IE)
        else { // address == 0xFFFF
            assert(0);
        }
    }
}



