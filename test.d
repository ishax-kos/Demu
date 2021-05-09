module test;
import std.stdio;


// enum string GET_CARRY = `
//     asm { 
//         lahf;
//         mov , AH;
//     \}`;


ubyte getCarry() {
    ubyte ret;
    ubyte val = 254;
    val += 1;
    asm {setc ret;}
    return ret;
}

void main() {
    writefln!"%b"(getCarry);
}
