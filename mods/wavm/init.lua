require 'os';
require 'io';

minetest.register_chatcommand("wavm", {
	params = "<filename>",
	description = "Calling WAVM Executable to run specified .wast filename",
	func = function( _ , filename)
		-- Get the working directory
		local path = io.popen("cd")
		local current_path = path:read("*a")
		current_path = current_path:gsub("bin\n", "")
		path:close()

		-- Paths to executable and specified file
		local execute_path = current_path .. "wavm_bin\\wavm-run.exe"
		local filename_path = current_path .. "wavm_bin\\WAST_files\\" .. filename

		-- Run executable with filename argument and print output to Minetest Chat
		local handle = io.popen(execute_path .. " " .. filename_path)
		local wavm_output = handle:read("*a")
		handle:close()
		minetest.chat_send_all(wavm_output)

		return true, "WAVM Executable was successfully run with specified filename"
	end,
})
