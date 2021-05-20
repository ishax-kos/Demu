module main;
import std.stdio;

import display;
import engine.processor;
import engine.ppu;




const SCREEN_WIDTH = 768;
const SCREEN_HEIGHT = 768;


void update(){

}


void main(string[] args) {
    string romFileString = "";
    if (args.length > 1) {
        romFileString = args[1];
    }

    auto system = new CPU(romFileString);
    auto display = new DisplayContext(SCREEN_WIDTH, SCREEN_HEIGHT, &(system.ram));
    auto ppu = new PPU(system.ram, display);

    display.drawGBRegion();
    while (display.noExit()) {
        system.update(0);
        display.update(0);
        wait(300);
        
    }
 
    // displayExit(display);
}

