module demu.data;


union Data2 {
    ubyte[2] u8;
    byte[2] s8;
    ushort u16;

    this(ubyte a, ubyte b) {
        u8 = [a, b];
    }
    
    this(ubyte[] a) {
        assert(a.length == 2);
        u8 = [a[0], a[1]];
    }
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