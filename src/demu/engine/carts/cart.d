module demu.engine.carts.cart;

class Cart {
    ubyte read(ushort address);
    void write(ushort address, ubyte value);
}