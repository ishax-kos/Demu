module main;
import std.stdio;

import gbdisplay;
import engine.processor;
import engine.ppu;
import core.time;




const SCREEN_WIDTH = 768;
const SCREEN_HEIGHT = 768;


void update(){

}


int main(string[] args) {
    string romFileString = "";
    if (args.length > 1) {
        romFileString = args[1];
    }

    auto system = new CPU(romFileString);
    auto display = new GBMainFrame("", SCREEN_WIDTH, SCREEN_HEIGHT, true);
    display.addSubframe(new GBDebugger("Debug", SCREEN_WIDTH/2, SCREEN_HEIGHT, false), false);
    auto ppu = new PPU(system.ram, display);

    ulong delay = MonoTime.currTime.ticks;
    immutable ulong TPS = MonoTime.ticksPerSecond();

    display.drawGBRegion();
    while (display.noShutdown) {
        auto deltaAccum = MonoTime.currTime.ticks - delay;
        if (deltaAccum > TPS/10) {
            delay = MonoTime.currTime.ticks;
            system.update(deltaAccum);
            display.update(deltaAccum);
        }
    }

    return 0;
}

