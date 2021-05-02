module demu.display;
import std.stdio;
import bindbc.sdl;
import bindbc.sdl.image;


struct DisplayContext {
    SDL_Window* window = null;
    SDL_Renderer* renderer = null;

    bool doUpdate;
    void update() {
        if (doUpdate) {
            
        }
    };
}


DisplayContext displayStart(uint width, uint height) {
    SDL_Window* window = null;
    SDL_Renderer* renderer = null;
    // catchErr!"could not initialize sdl2: %s\n"(SDL_Init(SDL_INIT_VIDEO) < 0);
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        stderr.writef!"could not initialize sdl2: %s\n"(SDL_GetError());
        return DisplayContext();
    }
    window = SDL_CreateWindow(
        "blooberdoob",
        SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
        width, height,
        SDL_WINDOW_SHOWN
    );
    if (window == null) {
        stderr.writef!"could not create window: %s\n"(SDL_GetError());
        return DisplayContext();
    }

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == null) {
        stderr.writef!"could not create renderer: %s\n"(SDL_GetError());
        return DisplayContext();
    }

    // IMG_LoadTexture(renderer, "cody.png")

    SDL_RenderClear(renderer);
    // SDL_RenderCopy(renderer, texture, null, null);
    SDL_RenderPresent(renderer);

    return DisplayContext(window, renderer);
}


void displayExit(DisplayContext context) {
    SDL_DestroyWindow(context.window);
    SDL_Quit();
}


bool get_displayNotExit() {
    SDL_Event event;
    if (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT)
        return false;
    }
    return true;
}