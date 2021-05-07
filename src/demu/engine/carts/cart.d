module demu.engine.carts.cart;

class Cart {
  abstract :
    ubyte read(ushort address);
    void write(ushort address, ubyte value);
}