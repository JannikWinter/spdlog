spdlogPath = "%{wks.location}/dependencies/spdlog"
spdlogBuildPath = "%{spdlogPath}/build/%{cfg.platform}_%{cfg.buildcfg}"

project "spdlog"
	kind "StaticLib"
	language "C++"
	targetdir "%{spdlogBuildPath}"

	warnings "Off"

	defines {
		"SPDLOG_COMPILED_LIB"
	}

	files {
		"include/spdlog/**.h",
		"src/spdlog.cpp",
		"src/stdout_sinks.cpp",
		"src/color_sinks.cpp",
		"src/file_sinks.cpp",
		"src/async.cpp",
		"src/cfg.cpp",
		"src/fmt.cpp"
	}

	includedirs {
		"include"
	}

	IncludeDir["spdlog"] = "%{spdlogPath}/include"
	LibraryDir["spdlog"] = "%{spdlogBuildPath}"
	Link["spdlog"] = "spdlog"

	filter "configurations:Debug"
        runtime "Debug"

    filter "configurations:Release"
        runtime "Release"