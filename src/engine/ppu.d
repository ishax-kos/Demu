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


    this(ref GameBoyMemoryState ram, Form display) {
        this.vram = ram.vram;
        this.oam = cast(typeof(this.oam)) ram.oam;
        this.display = display;
    }


    ubyte tileData(ulong index) {
        return vram.bank[vram.bankIndex][0x0000..0x1800][index];
    }
    void tileData(ulong index, ubyte data) {
        vram.bank[vram.bankIndex][0x0000..0x1800][index] = data;
    }
    ubyte tileMap1(ulong index) {
        return vram.bank[vram.bankIndex][0x1800..0x1C00][index];
    }
    void tileMap1(ulong index, ubyte data) {
        vram.bank[vram.bankIndex][0x1800..0x1C00][index] = data;
    }
    ubyte tileMap2(ulong index) {
        return vram.bank[vram.bankIndex][0x1C00..0x2000][index];
    }
    void tileMap2(ulong index, ubyte data) {
        vram.bank[vram.bankIndex][0x1C00..0x2000][index] = data;
    }


    ubyte write(Data2 address, ubyte data) {
        import std.stdio;
        tileData(address-0x8000, data);
        /// Tile Data
        if (address < 0x9800) {
            // set_faux_data()
            stdout.write("ppu draw");
        }
        /// Tile Map 1
        else if (address < 0x9C00) {
            drawScanline();
        }
        /// Tile Map 2
        else if (address < 0xA000) {
            drawScanline();
            // set_faux_data()
            // draw_to_();
        }
        return 0;
    }

    void drawScanline() {
        // import display_impl: PIXEL_MODE;
        ubyte[160] linePixels;// = tileData()[currentScanline*40..currentScanline*40+40];
        //length is 40;
        foreach (object; oam.bank[oam.bankIndex]) {
            if (object.yPos > currentScanline+16 
            &&  object.yPos < currentScanline+16+objSize) {
                expandOBJColor(
                    linePixels[object.xPos], 
                    getTileScanline(object.tileIndex, objSize),
                    object.palette
                );
            }
        }
        display.drawScanline(buffer, progress++);
    }


    ubyte[2] getTileScanline(uint tileIndex, ubyte size) {
        uint t = tileIndex * 16; // 64 pixels per tile / 4 bytes per pixel = 16 bytes per tile
        uint s = currentScanline % size;
        return tileData()[(t+s)..(t+s+2)];
    }

    void expandBGColor(void[] oBuffer, ubyte[] iBuffer, ubyte pIndex) {
        foreach (i; 0..oBuffer.length/2) {
            
            (cast(ushort[]) oBuffer)[i] = colorPaletteBG[pIndex][i%4];
        }
    }
    
    void expandOBJColor(void[] oBuffer, ubyte[] iBuffer, ubyte pIndex) {
        foreach (i; 0..oBuffer.length/2) {
            
            (cast(ushort[]) oBuffer)[i] = colorPaletteBG[pIndex][i%4];
        }
    }
}






struct SpriteEntry {
    ubyte yPos;
    ubyte xPos;
    ubyte tileIndex;
    union {private:
        Flag8 flags;
        ubyte raw;
    }
    bool order()    {return flags[7];}
    bool yFlip()    {return flags[6];}
    bool xFlip()    {return flags[5];}
    bool bwPal()    {return flags[4];}
    bool tileBank() {return flags[3];}
    ubyte palette() {return raw & 0b111;}
    // ubyte palette(ubyte val) {return raw |= (val & 0b111);}
}