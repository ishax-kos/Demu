module engine.ppu;

import data;
import display;
import engine.memory;
import bindbc.sdl: SDL_Rect, SDL_PIXELFORMAT_RGBA5551;


enum PIXEL_MODE = SDL_PIXELFORMAT_RGBA5551;


class PPU {
    Form display;
    auto vram = new BankSet!(ubyte[0x4000])();
    auto oam = new BankSet!(SpriteEntry[40])();

    Flag8 lcdControl;
    ubyte objSize() {return 8+8*lcdControl[2];}
    ubyte[2] backgroundPos;
    ubyte[2] windowPos;
    uint    currentScanline;
    uint    currentScanlineCompare;

    /// Palettes
    ubyte greyPaletteBG;
    ubyte greyPaletteOBJ1;
    ubyte greyPaletteOBJ2;

    ushort[4][8] colorPaletteBG;
    ushort[4][8] colorPaletteOBJ;

    ubyte colorPaletteBG_ptr;
    ubyte colorPaletteOBJ_ptr;
    ubyte colorPaletteOBJ_Data;

    this(ref GameBoyMemoryState ram, Frame display) {
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