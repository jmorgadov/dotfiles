flutter_tools = require("flutter-tools")

function frun()
	-- get current file folder path
	local current_path = debug.getinfo(1, "S").source:match("@?(.*/)")

	-- search for main.dart file
	local main_dart_path = current_path .. "main.dart"
	if not file_exists(main_dart_path) then
		print("main.dart not found")
		return
	end
end
