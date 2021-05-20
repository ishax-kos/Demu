module engine.carts.boot;

import std.stdio;
import engine.carts.cart;


class CartBootROM : Cart {

    this() {
        writeln("Boot rom");
    }


    override 
    ubyte read(ushort address) {
        stdout.write("bank access ");
        return 0;
    }


    override 
    ubyte write(ushort address, ubyte value) {
        return 0;
    }
}

