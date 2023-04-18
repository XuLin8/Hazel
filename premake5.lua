include "./vendor/premake/premake_customization/solution_items.lua"
workspace "Hazel" --解决方案名称
    architecture "x86_64" --编译平台 只编64位--(x86,x86_64,ARM)
    startproject "Hazelnut"
    configurations 
    {
        "Debug",
        "Release",
        "Dist"
    }
	solution_items
	{
		".editorconfig"
	}
    flags
	{
		"MultiProcessorCompile"
	}
--临时变量 定义 输出目录
--详细的所有支持的tokens 可参考 [https://github.com/premake/premake-core/wiki/Tokens]
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--Include directories relative to root folder (solution diretory)
IncludeDir = {}
IncludeDir["GLFW"] = "%{wks.location}/Hazel/vendor/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Hazel/vendor/Glad/include"
IncludeDir["ImGui"] = "%{wks.location}/Hazel/vendor/imgui"
IncludeDir["glm"] = "%{wks.location}/Hazel/vendor/glm"
IncludeDir["stb_image"] = "%{wks.location}/Hazel/vendor/stb_image"
IncludeDir["entt"] = "%{wks.location}/Hazel/vendor/entt/include"

group "Dependencies"
	include "vendor/premake"
	include "Hazel/vendor/GLFW"
	include "Hazel/vendor/Glad"
	include "Hazel/vendor/imgui"

group ""

include "Hazel"
include "Sandbox"
include "Hazelnut"
