import Clang.Generators
import lexbor_jll

cd(@__DIR__) do
    include_dir = normpath(joinpath(lexbor_jll.artifact_dir, "include"))
    @assert isdir(include_dir)

    options = Generators.load_options(joinpath(@__DIR__, "generator.toml"))

    args = Generators.get_default_args()
    push!(args, "-I$include_dir")

    # header_files = Generators.detect_headers(include_dir, args)
    header_files = [joinpath(include_dir, "lexbor", "html", "html.h")]

    ctx = Generators.create_context(header_files, args, options)

    Generators.build!(ctx)
end
