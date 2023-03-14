workspace "Hazel" --�����������
    architecture "x64" --����ƽ̨ ֻ��64λ--(x86,x86_64,ARM)

    configurations 
    {
        "Debug",
        "Release",
        "Dist"
    }
--��ʱ���� ���� ���Ŀ¼
--��ϸ������֧�ֵ�tokens �ɲο� [https://github.com/premake/premake-core/wiki/Tokens]
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--Include directories relative to root folder (solution diretory)
IncludeDir = {}
IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"
IncludeDir["Glad"] = "Hazel/vendor/Glad/include"

include "Hazel/vendor/GLFW"
include "Hazel/vendor/Glad"

project "Hazel" --��Ŀ����
    location "Hazel" --���·��
    kind "SharedLib" --��������Ŀ��dll��̬��
    language "c++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")--���Ŀ¼
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")--�м���ʱ�ļ���Ŀ¼

    pchheader "hzpch.h"
    pchsource "Hazel/src/hzpch.cpp"

    files--����Ŀ���ļ�
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs--���Ӱ���Ŀ¼
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}"
    }

    links
    {
        "GLFW",
        "Glad",
        "opengl32.lib"
    }
    
    filter "system:windows"--windowsƽ̨������
        cppdialect "c++17"
        staticruntime "On"
        systemversion "latest"

        defines --Ԥ�����
        {
            "HZ_BUILD_DLL",
            "HZ_PLATFORM_WINDOWS",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands -- build����Զ�������
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox") --��������dll�⵽sanbox.exe��ͬһĿ¼��ȥ
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        buildoptions "/MDd"
        symbols "on"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        buildoptions "/MD"
        optimize "on"

    filter "configurations:Dist"
        defines "HZ_DIST"
        buildoptions "/MD"
        optimize "on"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "c++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Hazel/vendor/spdlog/include",
        "Hazel/src"
    }

    links
    {
        "Hazel"
    }

    filter "system:windows"
        cppdialect "c++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "HZ_PLATFORM_WINDOWS",
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG"
        buildoptions "/MDd"
        symbols "on"

    filter "configurations:Release"
        defines "HZ_RELEASE"
        buildoptions "/MD"
        optimize "on"

    filter "configurations:Dist"
        defines "HZ_DIST"
        buildoptions "/MD"
        optimize "on"