const std = @import("std");
const ArrayList = std.ArrayList;

pub fn isArmstrongNumber(num: u128) bool {
    const allocator = std.heap.page_allocator;
    const memory = allocator.alloc(u128, 26) catch |err| {
        std.debug.print("Caught an allocation error: {}\n", .{err});
        return false;
    };
    defer allocator.free(memory);

    var remaining_num: u128 = num;
    var num_list = ArrayList(u128).init(allocator);
    var result: u128 = 0;
    while (remaining_num > 0) {
        var digit = remaining_num % 10;
        num_list.append(digit) catch |err| {
            std.debug.print("Failed to append {d}.\n{}\n", .{ digit, err });
            continue;
        };
        remaining_num = remaining_num / 10;
    }

    const size = num_list.items.len;
    while (num_list.items.len > 0) {
        const n = num_list.pop();
        result += std.math.pow(u128, n, size);
    }
    return result == num;
}
