const std = @import("std");
const Environment_File_Name = @import("value_object/environment.zig").Environment_File_Name;
const Module_File_Name = @import("value_object/module.zig").Module_File_Name;

const ENV_FOLDER = "env";
const MODULE_FOLDER = "module";

/// フォルダ作成
/// 引数: 作成基準フォルダ、親フォルダ名、子フォルダ名
pub fn create_template_folder(base_dir_path: []const u8, parent_name: []const u8, child_name: []const u8) !void {
    var base_dir = try std.fs.openDirAbsolute(base_dir_path, .{});
    defer base_dir.close();

    // 親フォルダが無ければ作成する。既に存在していても問題なし。
    try base_dir.makePath(parent_name);

    var parent = try base_dir.openDir(parent_name, .{});
    defer parent.close();

    // 子フォルダが無ければ作成する。既に存在していても問題なし。
    try parent.makePath(child_name);
}

/// ファイルテンプレート構成を作成する。
/// 引数: 作成基準フォルダ、親フォルダ名、子フォルダ名
pub fn create_template_files(base_dir_path: []const u8, parent_name: []const u8, child_name: []const u8) !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const rel_path = try std.fs.path.join(allocator, &.{ parent_name, child_name });
    defer allocator.free(rel_path);

    var base_dir = try std.fs.openDirAbsolute(base_dir_path, .{});
    defer base_dir.close();

    var target_dir = try base_dir.openDir(rel_path, .{});
    defer target_dir.close();

    var file_names: std.ArrayList([]const u8) = .empty;
    defer {
        for (file_names.items) |name| allocator.free(name);
        file_names.deinit(allocator);
    }

    if (std.mem.eql(u8, parent_name, ENV_FOLDER)) {
        for (std.enums.values(Environment_File_Name)) |field| {
            const file = try std.mem.concat(allocator, u8, &.{ @tagName(field), ".tf" });
            try file_names.append(allocator, file);
        }
    } else if (std.mem.eql(u8, parent_name, MODULE_FOLDER)) {
        for (std.enums.values(Module_File_Name)) |field| {
            const file = try std.mem.concat(allocator, u8, &.{ @tagName(field), ".tf" });
            try file_names.append(allocator, file);
        }
    }

    for (file_names.items) |name| {
        const f = try target_dir.createFile(name, .{});
        f.close();
    }
}
