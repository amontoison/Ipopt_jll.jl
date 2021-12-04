# Autogenerated wrapper script for Ipopt_jll for armv6l-linux-musleabihf-libgfortran3-cxx03
export amplexe, libipopt, libipoptamplinterface

using ASL_jll
using MUMPS_seq_jll
using OpenBLAS32_jll
using CompilerSupportLibraries_jll
JLLWrappers.@generate_wrapper_header("Ipopt")
JLLWrappers.@declare_library_product(libipopt, "libipopt.so.3")
JLLWrappers.@declare_library_product(libipoptamplinterface, "libipoptamplinterface.so.3")
JLLWrappers.@declare_executable_product(amplexe)
function __init__()
    JLLWrappers.@generate_init_header(ASL_jll, MUMPS_seq_jll, OpenBLAS32_jll, CompilerSupportLibraries_jll)
    JLLWrappers.@init_library_product(
        libipopt,
        "lib/libipopt.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libipoptamplinterface,
        "lib/libipoptamplinterface.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        amplexe,
        "bin/ipopt",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()