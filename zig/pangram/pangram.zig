const std = @import("std");
const ascii = std.ascii;
const u16BitSet = std.bit_set.IntegerBitSet;

const CharacterCount = 26;

pub fn isPangram(str: []const u8) bool {
    var str_chars = u16BitSet(CharacterCount).initEmpty();

    for (str) |chr| {
        if (ascii.isUpper(chr)) {
            str_chars.set(chr - 'A');
        } else if (ascii.isLower(chr)) {
            str_chars.set(chr - 'a');
        }
    }

    return (str_chars.count() == CharacterCount);
}
