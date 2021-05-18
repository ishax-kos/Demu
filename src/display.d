module display;
import std.stdio;
import bindbc.sdl;
import process;
import engine.memory;


// import bindbc.sdl.image;


class DisplayContext : Update {
    SDL_Window* window = null;
    SDL_Renderer* renderer = null;
    SDL_Texture* gbScreen = null;
    GameBoyMemoryState* ram = null;


    this(uint width, uint height, GameBoyMemoryState* ram) {
        version(Windows) {
            auto ret = loadSDL("libs/SDL2.dll");
            if(ret != sdlSupport) {
                // stderr.writef!"could not load lib: %s\n"(SDL_GetError());
                assert(0);
            }
        }
        
        this.ram = ram;

        window = SDL_CreateWindow(
            "Demulator",
            SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
            width, height,
            SDL_WINDOW_SHOWN
        );
        if (window == null) {
            // stderr.writef!"could not create window: %s\n"(SDL_GetError());
            assert(0);
        }

        renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
        if (renderer == null) {
            // stderr.writef!"could not create renderer: %s\n"(SDL_GetError());
            assert(0);
        }

        // auto surf0 = SDL_CreateRGBSurfaceWithFormat(0,  256,256,  16,  SDL_PIXELFORMAT_RGBA5551);
        // if (surf0 == null) assert(0, "No Surface");
        gbScreen = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA5551, SDL_TEXTUREACCESS_STREAMING, 256,256);
        if (gbScreen == null) assert(0, "No Tex");
        // SDL_FreeSurface(surf0);

        SDL_RenderClear(renderer);
    }


    ~this() {
        SDL_DestroyWindow(window);
        SDL_DestroyRenderer(renderer);
        SDL_Quit();
    }


    bool noExit() {
        SDL_Event event;
        if (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT)
            return false;
        }
        return true;
    }


    bool doUpdate = true;
    override void update(ulong delta) {
        if (doUpdate) {
            // SDL_Rect(x,y,8,8);
            SDL_Rect area = SDL_Rect(0,0,256,256);
            SDL_Rect areaScreen = SDL_Rect(8,8,256*2,256*2);

            // SDL_RenderCopy(renderer, gbScreen, &area, &areaScreen);
            SDL_RenderPresent(renderer);
        }
    };



    void drawGBRegion(
        // ubyte[] buffer
        ) {
        // uint len = cast(int) buffer.length;
        SDL_Rect area = SDL_Rect(0,0,256,256);
        SDL_Rect areaScreen = SDL_Rect(8,8,256*4,256*4);
        uint tileArea = 0;
        enum uint blockSize = 384 * 64; /// Tiles * pixels per tile
        void* pixels;
        int pitch; /// unused
        SDL_LockTexture(gbScreen, &area, &pixels, &pitch);
        expandColor(pixels[0..blockSize*2], []); /// blockSize*2 because there are 2 bytes in a ushort
        // SDL_UpdateTexture( gbScreen, &area, data, 64 );

        SDL_UnlockTexture(gbScreen);
        SDL_RenderCopy(renderer, gbScreen, &area, &areaScreen);
    }
    void drawTile(ubyte[] buffer, uint x, uint y) {};

    
}


private 
void expandColor(void[] oBuffer, ubyte[] iBuffer) {
    static ushort[4] pallet = [
        0b11111_01111_00000_1,
        0b00111_01111_00011_1,
        0b01111_01111_10011_1,
        0b11111_11111_00000_1
    ];
    // ushort[] newBuffer;
    // newBuffer.length = buffer.length * 4;

    foreach (i; 0..oBuffer.length/2) {
        int subI = i%4;
        // int j = i%4;
        (cast(ushort[]) oBuffer)[i] = pallet[i%4];
        // newBuffer[i] = pallet[ (buffer[subI] >> (subI*2)) & 3 ];
    }
}


