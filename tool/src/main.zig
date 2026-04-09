const std = @import("std");
const aws_terraform = @import("aws_terraform");
const Service = @import("service.zig");

fn print_usage() void {
    std.debug.print(
        \\使い方:
        \\  aws_terraform [-C 作成先フォルダ] <parent_name> <child_name>
        \\
        \\例:
        \\  aws_terraform env dev
        \\  aws_terraform -C /path/to/project module vpc
        \\
        \\補足:
        \\  -C を省略した場合は、実行ファイル配置先(tool/bin)の1つ上を作成先にします。
        \\
    , .{});
}

pub fn main() !void {
    const alc = std.heap.page_allocator;
    var args = try std.process.argsWithAllocator(alc);

    defer args.deinit();

    _ = args.next();

    const exe_path = try std.fs.selfExePathAlloc(alc);
    defer alc.free(exe_path);
    const exe_dir = std.fs.path.dirname(exe_path) orelse ".";
    const default_base_dir = try std.fs.path.resolve(alc, &.{ exe_dir, ".." });
    defer alc.free(default_base_dir);

    var base_dir_path = default_base_dir;

    var first = args.next() orelse {
        print_usage();
        return;
    };

    if (std.mem.eql(u8, first, "-C")) {
        const raw_base_dir = args.next() orelse {
            print_usage();
            return;
        };
        base_dir_path = try std.fs.path.resolve(alc, &.{ raw_base_dir });
        first = args.next() orelse {
            print_usage();
            return;
        };
    }

    // 引数の内容から親フォルダ名と子フォルダ名を取得する。
    const parent_name = first;
    const child_name = args.next() orelse {
        print_usage();
        return;
    };

    if (args.next() != null) {
        print_usage();
        return;
    }

    try Service.create_template_folder(base_dir_path, parent_name, child_name);
    try Service.create_template_files(base_dir_path, parent_name, child_name);
}
