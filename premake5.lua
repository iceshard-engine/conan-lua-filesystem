require "conan"

newoption {
    trigger = "arch",
    description = "Build for the given architecture",
    value = "ARCH"
}

workspace "LuaFilesystem"
    configurations { "Debug", "Release" }

    architecture(_OPTIONS.arch)

    filter { "action:vs*" }
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter { "Debug" }
        symbols "On"

    filter { "Release" }
        optimize "On"

    project "lfs"
        kind "SharedLib"
        language "C"

        conan {
            "lua"
        }

        includedirs {
            "src"
        }

        files {
            "src/*"
        }
