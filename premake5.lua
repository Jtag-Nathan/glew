project "GLEW"
    kind "StaticLib"
    language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
		"src/**.h",
		"src/**.c"
    }
	
	includedirs
	{
		"./include",
	}

    filter "system:windows"
        systemversion "latest"
		defines
		{
			"GLEW_STATIC"
		}

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

	filter { "system:windows", "configurations:Debug" }
        buildoptions "/MTd"
		
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"