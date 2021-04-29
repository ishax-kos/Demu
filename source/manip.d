module manip;

union TypeRead {
    void[2] raw;
    ubyte[2] u8;
    byte[2] s8;
    ushort u16;
    this(void[2] rawBytes) {
        raw = rawBytes;
    }
}