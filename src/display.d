module display;
import std.stdio;
import bindbc.sdl;
import process;
import engine.memory;
import std.format;
import display_impl;


// enum PIXEL_MODE_SWITCH = "index8";
// static if (PIXEL_MODE_SWITCH == "index8") {
//     enum PIXEL_MODE = SDL_PIXELFORMAT_INDEX8;
// }
// static if (PIXEL_MODE_SWITCH == "channel16"){
//     enum PIXEL_MODE = SDL_PIXELFORMAT_RGBA5551;
// }



class MainForm : Form {
    bool noShutdown = true;
    Form[uint] Forms;
    Form[] subForms;
    this(string name, uint width, uint height, bool resize) {
        
        version(Windows) {
            auto ret = loadSDL("lib/SDL2.dll");
            assert(ret == sdlSupport, format!"could not load lib: %s\n"(SDL_GetError()));
        }
        super(name, width, height, resize);
        Forms[SDL_GetWindowID(this.window)] = this;
    }
    

    SubForm newSubForm(string name, uint width, uint height, bool resize, bool _open = false) {
        return addSubForm(new SubForm(name, width, height, resize), _open);
    }
    SubForm addSubForm(SubForm child, bool _open = false) {
        Forms[SDL_GetWindowID(child.window)] = child;
        subForms ~= child;
        if (!_open) child.close;
        return child;
    }


    override void update(ulong delta) {
        super.update(delta);
        foreach (ref fr; subForms) if (fr.isOpen) {
            fr.update(delta);
        }
        handleEvents();

    }


    override void close() {
        foreach (key, ref fr; Forms) {
            destroy(fr);
        }
        noShutdown = false;
        SDL_Quit();
    }


    void handleEvents() {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            switch (event.type) {
            case SDL_WINDOWEVENT: 
                switch (event.window.event) {
                case SDL_WINDOWEVENT_CLOSE:
                    this.Forms[event.window.windowID].close;
                    break;

                default: 
                    break;
                }
                break;
            
            case SDL_QUIT:
                this.close;
                break;

            default: 
                break;
            }
        }
    }
}


class SubForm : Form {
    this(string name, uint width, uint height, bool resize) {
        super(name, width, height, resize);
    }
}


class Form : Update {
    SDL_Window* window = null;
    SDL_Renderer* renderer = null;
    SDL_Texture* texture = null;
    GameBoyMemoryState* ram = null;
    bool isOpen = true;

    this(string name, uint width, uint height, bool resize) {
        window = SDL_CreateWindow(name.ptr, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 
            width, height, 
            SDL_WINDOW_SHOWN | cast(SDL_WindowFlags) (resize * SDL_WINDOW_RESIZABLE)
        );
        assert(window != null, format!"could not create window: %s\n"(SDL_GetError()));

        renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
        assert(renderer != null, format!"could not create renderer: %s\n"(SDL_GetError()));

        texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA5551, SDL_TEXTUREACCESS_STREAMING, 256,256);
        assert(texture != null, format!"No Tex: %s\n"(SDL_GetError()));

        SDL_RenderClear(renderer);
    }


    ~this() {
        SDL_DestroyWindow(window);
        SDL_DestroyRenderer(renderer);
    }


    void close() {
        isOpen = false;
        SDL_HideWindow(window);
    }
    void open() {
        isOpen = true;
        SDL_ShowWindow(window);
    }

    
    override void update(ulong delta) { 
        SDL_RenderPresent(renderer);
    }


    mixin GBDisplay_impl;
}

// expandColor(pixels[0..blockSize*2], []);


// void drawGBRegion() {
//     SDL_Rect area = SDL_Rect(0,0,256,256);
//     SDL_Rect areaScreen = SDL_Rect(8,8,256*3,256*3);
//     SDL_SetWindowSize(window, areaScreen.w+areaScreen.x*2, areaScreen.h+areaScreen.y*2);
//     uint tileArea = 0;
//     enum uint blockSize = 1024 * 64; /// Tiles * pixels per tile
//     void* pixels;
//     int pitch; /// unused
//     SDL_LockTexture(texture, &area, &pixels, &pitch);
//     expandColor(pixels[0..blockSize*2], []); /// blockSize*2 because there are 2 bytes in a ushort
//     // SDL_UpdateTexture( texture, &area, data, 64 );

//     SDL_UnlockTexture(texture);
//     SDL_RenderCopy(renderer, texture, &area, &areaScreen);
// }