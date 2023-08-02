pub fn LinkedList(comptime T: type) type {
    return struct {
        const Self = @This();

        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        pub fn push(list: *Self, new_node: *Node) void {
            if (list.len > 0) {
                var first_node = list.first.?;
                var last_node = list.last.?;
                new_node.prev = last_node;
                new_node.next = first_node;
                first_node.prev = new_node;
                last_node.next = new_node;
            } else {
                list.first = new_node;
                new_node.prev = list.first.?;
                new_node.next = list.first.?;
            }
            list.last = new_node;
            list.len += 1;
        }

        pub fn pop(list: *Self) ?*Node {
            if (list.len == 0) {
                return null;
            }
            var first_node = list.first.?;
            var last_node = list.last.?;
            var second_last_node = last_node.prev.?;
            second_last_node.next = first_node;
            first_node.prev = second_last_node;
            list.last = second_last_node;
            list.len -= 1;
            return last_node;
        }

        pub fn shift(list: *Self) ?*Node {
            if (list.len == 0) {
                return null;
            }
            var first_node = list.first.?;
            var last_node = list.last.?;
            var second_node = first_node.next.?;
            second_node.prev = first_node.prev.?;
            last_node.next = second_node;
            list.first = second_node;
            list.len -= 1;
            return first_node;
        }

        pub fn unshift(list: *Self, new_node: *Node) void {
            if (list.len > 0) {
                var first_node = list.first.?;
                var last_node = list.last.?;
                first_node.prev = new_node;
                last_node.next = new_node;
                new_node.next = first_node;
                new_node.prev = last_node;
            } else {
                list.last = new_node;
                new_node.prev = list.last.?;
                new_node.next = list.last.?;
            }
            list.first = new_node;
            list.len += 1;
        }

        pub fn delete(list: *Self, node: *Node) void {
            if (list.len == 0) {
                return;
            }
            var idx: usize = 0;
            var list_node = list.first.?;
            if (list.len == 1 and list_node.data == node.data) {
                list.first = null;
                list.last = null;
                list.len = 0;
                return;
            }
            while (idx < list.len) {
                if (list_node.data == node.data) {
                    var prev_node = list_node.prev.?;
                    var next_node = list_node.next.?;
                    prev_node.next = next_node;
                    next_node.prev = prev_node;
                    list_node.prev = null;
                    list_node.next = null;
                    if (idx == 0) {
                        list.first = next_node;
                    } else if (idx == list.len - 1) {
                        list.last = prev_node;
                    }
                    list.len -= 1;
                    break;
                }
                list_node = list_node.next.?;
                idx += 1;
            }
        }
    };
}
