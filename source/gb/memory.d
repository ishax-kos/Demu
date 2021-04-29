module gb.memory;

enum FBit
{
    Z = 0b0000_0001,
    N = 0b0000_0010,
    H = 0b0000_0100,
    C = 0b0000_1000,
}


union Arguments {
    void[2] raw;
    ubyte[2] u8;
    byte[2] s8;
    ushort u16;
    this(void[2] rawBytes) {
        raw = rawBytes;
    }
}

align(1)
struct GameBoyCPUState {
    union { 
        struct {
            ubyte accum;
            ubyte flags;
            ubyte rB;
            ubyte rC;
            ubyte rD;
            ubyte rE;
            ubyte rH;
            ubyte rL;
        }
        struct {
            ushort rAF;
            ushort rBC;
            ushort rDE;
            ushort rHL;
        }
    }
    ushort programCounter;
    ushort stackPointer;

    GameBoyMemoryState memory = GameBoyMemoryState();

    bool flagZero() {
        return (FBit.Z & flags) == FBit.Z;
    }
    bool flagNSub() {
        return (FBit.N & flags) == FBit.N;
    }
    bool flagHalf() {
        return (FBit.H & flags) == FBit.H;
    }
    bool flagCarry() {
        return (FBit.C & flags) == FBit.C;
    }
    void flagZero(bool) {
        flags |= FBit.Z;
    }
    void flagNSub(bool) {
        flags |= FBit.N;
    }
    void flagHalf(bool) {
        flags |= FBit.H;
    }
    void flagCarry(bool) {
        flags |= FBit.C;
    }

    ushort* args16() {
        return cast(ushort*) (memory.data.ptr + programCounter + 1);
    }
    ubyte* args8() {
        return cast(ubyte*) (memory.data.ptr + programCounter + 1);
    }
    // byte* args8off() {
    //     byte off = 
    //     return cast(byte*) (memory.data+programCounter+1);
    // }
}


private:
    const KB = 1024;


align(1)
struct GameBoyMemoryState {
    union { void[0x10000] data;
        struct {
            void[0x0000] bank0;
        }


        struct {
            void[0x100-0x000] rst;
            void[0x150-0x100] romHeader;
            void* programStart;
        }
        struct {
            void[0x8000-0x0000] program;
            union { void[0xA000-0x8000] picture;

                struct {
                    void[0x9800-0x8000] bank0_errr;
                    void[0x9C00-0x9800] bg1;
                    void[0xA000-0x9C00] bg2;
                }
            }
            void[0xC000-0xA000] externalExpansionWorkingRAM;
            void[0xE000-0xC000] unitWorkingRAM;

            immutable void[0xFE00-0xE000] prohibited_0;

            void[0xFEA0-0xFE00] OAM;
            
            immutable void[0xFF00-0xFEA0] prohibited_1;

            InputOutput PMCSRegisters;
            //0xFF80-0xFF00
            void[0xFFFE-0xFF80] WorkingStackRAM;
            void[0xFFFF-0xFFFE] Gap0;
        
        }
    }
    
}

align(1)
struct InputOutput {
    union { void[0xFF80-0xFF00] mem;
        struct{
            ubyte controller;
            void[2] communication;
            immutable void[1] gap0;

            void[4] dividerTimer;
            immutable void[2] gap1;

            void[23] sound;
            immutable void[3] gap2;

            void[16] waveform;
            void[12] lcdControl;
            immutable void[3] gap3;

            ubyte vramBankSelect;
            ubyte disableBootROM;
            void[5] hdma;
            immutable void[12] gap4;

            void[2] bcpOCP;
            void[1] wramBankSelect;
        }
    }
}