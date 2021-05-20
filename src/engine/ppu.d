module engine.ppu;

import data;
import display;
import engine.memory;

class PPU {
    DisplayContext display;
    BankSet!0x4000 vram;
    BankSet!0xA0   oam;

    Flag8 lcdControl;
    ubyte[2] backgroundPos;
    ubyte[2] windowPos;
    ubyte    currentScanline;
    ubyte    currentScanlineCompare;

    /// Palettes
    ubyte greyPalletBG;
    ubyte greyPalletOBJ1;
    ubyte greyPalletOBJ2;

    ubyte colorPalletBG_ptr;
    ubyte colorPalletOBJ_ptr;
    ubyte colorPalletOBJ_Data;


    this(ref GameBoyMemoryState ram, DisplayContext display) {
        this.vram = ram.vram;
        this.oam = ram.oam;
        this.display = display;
    }


    ubyte write(Data2 address) {
        import std.stdio;
        /// Tile Data
        if (address < 0x9800) {
            // set_faux_data()
            stdout.write("ppu draw");
        }
        /// Tile Map 1
        else if (address < 0x9C00) {
            // set_faux_data()
        }
        /// Tile Map 2
        else if (address < 0xA000) {
            // set_faux_data()
            // draw_to_();
        }
        return 0;
    }
}


void draw() {};