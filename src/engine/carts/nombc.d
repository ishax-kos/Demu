module engine.carts.nombc;

import engine.carts.cart;


class CartNoMBC : Cart {

    override 
    ubyte read(ushort address) {
        return 0;
    }


    override 
    ubyte write(ushort address, ubyte value) {
        return 0;
    }
}

