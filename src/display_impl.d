module display_impl;

// import display;
import bindbc.sdl;




mixin template GBDisplay_impl() {

    

    uint gameScale = 3;
    enum MARGIN = 8;
    enum GB_SCREEN_W = 160;
    enum GB_SCREEN_H = 144;

    void drawScanline(ubyte[] buffer, int progress) {
        SDL_Rect areaTexture = SDL_Rect(0,0,GB_SCREEN_W,1);
        SDL_Rect areaScreen = SDL_Rect(
            MARGIN,
            MARGIN + progress * gameScale,

            GB_SCREEN_W * gameScale,
            gameScale
        );

        void* pixels;
        int pitch; /// unused
        SDL_LockTexture(texture, &areaTexture, &pixels, &pitch);
        /// blockSize*2 because there are 2 bytes in a ushort
        foreach (i, pixel; buffer) {
            (cast(ubyte*) pixels)[i] = pixel;
        }

        SDL_UnlockTexture(texture);
        SDL_RenderCopy(renderer, texture, &areaTexture, &areaScreen);
    }

    void getPalette() {
        
    }
}