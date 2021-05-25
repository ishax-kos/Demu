module gbdisplay;

import display;
import bindbc.sdl;

class GBMainFrame : Frame {

    this(string name, uint width, uint height, bool resize) {
        super(name, width, height, resize);
    }


    void drawGBRegion(
        // ubyte[] buffer
        ) {
        // uint len = cast(int) buffer.length;
        SDL_Rect area = SDL_Rect(0,0,256,256);
        SDL_Rect areaScreen = SDL_Rect(8,8,256*3,256*3);
        SDL_SetWindowSize(window, areaScreen.w+areaScreen.x*2, areaScreen.h+areaScreen.y*2);
        uint tileArea = 0;
        enum uint blockSize = 1024 * 64; /// Tiles * pixels per tile
        void* pixels;
        int pitch; /// unused
        SDL_LockTexture(texture, &area, &pixels, &pitch);
        expandColor(pixels[0..blockSize*2], []); /// blockSize*2 because there are 2 bytes in a ushort
        // SDL_UpdateTexture( texture, &area, data, 64 );

        SDL_UnlockTexture(texture);
        SDL_RenderCopy(renderer, texture, &area, &areaScreen);
    }
    void drawregion(ubyte[] buffer) {
        static uint progress = 0;
    };//*/
}


class GBDebugger : SubFrame {
    this(string name, uint width, uint height, bool resize) {
        super(name, width, height, resize);
    }
}


private 
void expandColor(
    void[] oBuffer, 
    ubyte[] iBuffer, 
    ushort[4][] palettes = [[
        0b11111_01111_00000_1,
        0b00111_01111_00011_1,
        0b01111_01111_10011_1,
        0b11111_11111_00000_1
    ]]
    ) {
    foreach (i; 0..oBuffer.length/2) {
        int subI = i%4;
        (cast(ushort[]) oBuffer)[i] = palettes[0][i%4];
    }
}


// void wait(uint timeMs) {
//     SDL_Delay(timeMs);
// }


void getPalette() {
    
}
