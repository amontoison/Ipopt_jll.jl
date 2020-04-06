# Autogenerated wrapper script for Ipopt_jll for i686-linux-gnu-libgfortran5-cxx11
export libipopt, amplexe

using ASL_jll
using OpenBLAS32_jll
using MUMPS_seq_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libipopt`
const libipopt_splitpath = ["lib", "libipopt.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libipopt_path = ""

# libipopt-specific global declaration
# This will be filled out by __init__()
libipopt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libipopt = "libipopt.so.3"


# Relative path to `amplexe`
const amplexe_splitpath = ["bin", "ipopt"]

# This will be filled out by __init__() for all products, as it must be done at runtime
amplexe_path = ""

# amplexe-specific global declaration
function amplexe(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(amplexe_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Ipopt")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (ASL_jll.PATH_list, OpenBLAS32_jll.PATH_list, MUMPS_seq_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (ASL_jll.LIBPATH_list, OpenBLAS32_jll.LIBPATH_list, MUMPS_seq_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libipopt_path = normpath(joinpath(artifact_dir, libipopt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libipopt_handle = dlopen(libipopt_path)
    push!(LIBPATH_list, dirname(libipopt_path))

    global amplexe_path = normpath(joinpath(artifact_dir, amplexe_splitpath...))

    push!(PATH_list, dirname(amplexe_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

