import std.stdio;


immutable byte[] peepee;
shared static this() {
    peepee.length = 5;
    peepee = [1, 2, 3, 4, 5];
}


void main() {
    // ubyte ub = 130;
    // byte b = ub;
    writeln(peepee);
}


// ushort getU16(ubyte a, ubyte b) {
//     return Data2(a, b).u16;
// }


// union Data2 {
//     ubyte[2] u8;
//     byte[2] s8;
//     ushort u16;

//     this(ubyte a, ubyte b) {
//         u8 = [a, b];
//     }

//     this(ubyte[] a) {
//         assert(a.length == 2);
//         u8 = [a[0], a[1]];
//     }
// }