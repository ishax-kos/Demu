module main;
import std.stdio;

import display;
import engine.processor;



const SCREEN_WIDTH = 1024;
const SCREEN_HEIGHT = 720;


void update(){

}


void main() {
    auto system = new CPU();
    auto display = new DisplayContext(SCREEN_WIDTH, SCREEN_HEIGHT, &(system.ram));

    display.drawGBRegion();
    while (display.noExit()) {
        system.update(0);
        display.update(0);
        
    }
 
    // displayExit(display);
}

