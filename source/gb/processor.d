module gb.cpu;

import gb.memory;
import gb.instructions;
import manip;

struct CPU {
    GameBoyCPUState state;

    void execute() {
        typeof(instruction[0]) instruction = instruction[ *state.args8() ];
        instruction(state);
    }
}