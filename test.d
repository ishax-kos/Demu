import std.stdio;
import std.format;

enum NUMBER = 11;

enum TOKEN_STRING = q{
    int giveMe%1$s() {
        return %1$s;
    }
};


mixin(TOKEN_STRING.format(NUMBER));

void main() {
    writefln("the value is %s.", giveMe11);
}