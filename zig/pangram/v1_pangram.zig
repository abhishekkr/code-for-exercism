const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    // Not sure if this is the best allocator for this scenario.
    const allocator = std.heap.page_allocator;
    const memory = allocator.alloc(u8, 26) catch |err| {
        std.debug.print("Caught an allocation error: {}\n", .{err});
        return false;
    };
    defer allocator.free(memory);

    var str_chars = std.AutoHashMap(u8, void).init(allocator);
    defer str_chars.deinit();

    for (str) |chr| {
        var tmp_chr: u8 = undefined;
        if (chr > 64 and chr < 91) {
            tmp_chr = chr + 32;
        } else if (chr > 96 and chr < 123) {
            tmp_chr = chr;
        } else {
            continue;
        }

        if (!str_chars.contains(tmp_chr)) {
            str_chars.put(tmp_chr, {}) catch |err| {
                std.debug.print("Caught an allocation error: {}\n", .{err});
                continue;
            };
        }
    }

    // Not sure what else to do for Key Length, 'len' doesn't work for this.
    var idx: usize = 0;
    var it = str_chars.keyIterator();
    while (it.next() != null) {
        idx += 1;
    }
    if (idx == 26) {
        return true;
    }
    return false;
}
