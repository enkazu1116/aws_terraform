const std = @import("std");
const aws_terraform = @import("aws_terraform");
const Service = @import("service.zig");

pub fn main() !void {
    const alc = std.heap.page_allocator;
    var args = try std.process.argsWithAllocator(alc);

    defer args.deinit();

    _ = args.next();

    // 引数の内容から親フォルダ名と子フォルダ名を取得する。
    const parent_name = args.next() orelse {
        std.debug.print("引数が必要\n", .{});
        return;
    };
    const child_name = args.next() orelse {
        std.debug.print("引数が必要\n", .{});
        return;
    };

    try Service.create_template_folder(parent_name, child_name);
    try Service.create_template_files(parent_name, child_name);
}
