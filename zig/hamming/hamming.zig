const std = @import("std");

pub const DnaError = error{
    EmptyDnaStrands,
    UnequalDnaStrands,
};

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }
    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }
    var size: u8 = 0;
    for (0..first.len) |idx| {
        if (first[idx] != second[idx]) {
            size += 1;
        }
    }
    return size;
}
