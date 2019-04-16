-- scaffold geniefile for sajson

sajson_script = path.getabsolute(path.getdirectory(_SCRIPT))
sajson_root = path.join(sajson_script, "sajson")

sajson_includedirs = {
	path.join(sajson_script, "config"),
	sajson_root,
}

sajson_libdirs = {}
sajson_links = {}
sajson_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { sajson_includedirs }
	end,

	_add_defines = function()
		defines { sajson_defines }
	end,

	_add_libdirs = function()
		libdirs { sajson_libdirs }
	end,

	_add_external_links = function()
		links { sajson_links }
	end,

	_add_self_links = function()
		links { "sajson" }
	end,

	_create_projects = function()

project "sajson"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		sajson_includedirs,
	}

	defines {}

	files {
		path.join(sajson_script, "config", "**.h"),
		path.join(sajson_root, "**.h"),
		path.join(sajson_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
