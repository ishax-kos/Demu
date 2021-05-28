import std.stdio;
import std.format;

enum A = "enum B = \"mixin (C);\";";

enum C = "int val = 5;";

mixin (A);

void main() {
    mixin (B);
    writeln(val);
}