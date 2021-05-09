module demu.data;


union Data2 {
    private Data1[2] size8;
    void opIndexAssign(Data1 value, size_t index) {
        size8[index] = value;
    }
    Data1 opIndex(size_t index) {
        return size8[index];
    }
    ushort u16;

    this(ubyte a, ubyte b) {
        size8[0].u8 = a;
        size8[1].u8 = b;
    }
    
    this(ubyte[] a) {
        assert(a.length == 2);
        size8[0].u8 = a[0];
        size8[1].u8 = a[1];
    }
}


union Data1 {
    ubyte u8;
    byte s8;
}

// template 
// {
class BankSet(int S) {
    ubyte[S][] bank;
    int bankIndex = 0;

    ref ubyte[S] currentBank() {
        return bank[bankIndex];
    }

    this(int banks = 1, int index = 0) {
        bank.length = banks;
        bankIndex = index;
    } 
}
// }