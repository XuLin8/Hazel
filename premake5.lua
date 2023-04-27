include "./vendor/premake/premake_customization/solution_items.lua"
include "Dependencies.lua"
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


group "Dependencies"
	include "vendor/premake"
	include "Hazel/vendor/GLFW"
	include "Hazel/vendor/Glad"
	include "Hazel/vendor/imgui"
	include "Hazel/vendor/yaml-cpp"

group ""

include "Hazel"
include "Sandbox"
include "Hazelnut"
