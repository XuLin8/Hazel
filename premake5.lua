include "./vendor/premake/premake_customization/solution_items.lua"
include "Dependencies.lua"
workspace "Hazel" --�����������
    architecture "x86_64" --����ƽ̨ ֻ��64λ--(x86,x86_64,ARM)
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
--��ʱ���� ���� ���Ŀ¼
--��ϸ������֧�ֵ�tokens �ɲο� [https://github.com/premake/premake-core/wiki/Tokens]
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
