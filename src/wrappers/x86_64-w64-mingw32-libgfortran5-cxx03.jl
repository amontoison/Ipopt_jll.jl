# Autogenerated wrapper script for Ipopt_jll for x86_64-w64-mingw32-libgfortran5-cxx03
export amplexe, libipopt

using ASL_jll
using OpenBLAS32_jll
using MUMPS_seq_jll
using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("Ipopt")
JLLWrappers.@declare_executable_product(amplexe)
JLLWrappers.@declare_library_product(libipopt, "libipopt-3.dll")
function __init__()
    JLLWrappers.@generate_init_header(ASL_jll, OpenBLAS32_jll, MUMPS_seq_jll, CompilerSupportLibraries_jll)
    JLLWrappers.@init_executable_product(
        amplexe,
        "bin\\ipopt.exe",
    )

    JLLWrappers.@init_library_product(
        libipopt,
        "bin\\libipopt-3.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
