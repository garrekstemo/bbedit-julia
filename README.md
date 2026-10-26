# Julia syntax highlighting for BBEdit

A codeless language module that gives `.jl` files proper Julia coloring and
a function menu in BBEdit.

## Install

```sh
git clone https://github.com/garrekstemo/bbedit-julia.git
cd bbedit-julia
./install.sh
```

Then restart BBEdit. To install by hand, copy `Language Modules/Julia.plist`
into `~/Library/Application Support/BBEdit/Language Modules/` and restart.
`./install.sh --uninstall` removes it.

If you installed the older module from JuliaEditorSupport
(`BBEditTextWrangler-julia.plist`), delete it. Both claim `.jl`, and the
installer warns if it finds one.

## What it colors

- **Keywords**: Julia 1.12's reserved words plus the contextual ones
  (`mutable`, `abstract`, `primitive`, `where`, `in`, `isa`, `outer`, `as`,
  `public`).
- **Predefined names**: every name Base exports in Julia 1.12 (types such
  as `Vector` and `Dict`, functions such as `push!` and `println`, macros
  such as `@time` and `@kwdef`, and constants such as `nothing`, `missing`
  and `Inf`), plus common stdlib macros (`@test`, `@testset`, `@printf`,
  `@threads`, `@spawn`) and BenchmarkTools' `@btime` and `@benchmark`.
- **Strings**: `"..."`, `"""..."""`, prefixed strings (`r"..."`,
  `raw"..."`, `b"..."`, `L"..."` and any other string macro), commands in
  backticks, and character literals. `$( )` interpolation may contain its
  own quoted strings without breaking the coloring, and the adjoint `A'`
  isn't mistaken for a character literal.
- **Comments**: `#` line comments and nested `#= =#` block comments.

Edit > Un/Comment uses `#`, and block commenting uses `#= =#`.

## Function menu

The function popup lists `function`, `macro`, `struct` and
`mutable struct` definitions, one-line forms like `function f end`, and
short-form definitions such as `area(r) = π * r^2` or
`Base.show(io::IO, p::Point) = ...`, including ones preceded by macros like
`@inline` or `Base.@kwdef`. A long-form definition ends at the `end` with
the same indentation as its opening line, so the menu relies on
conventional indentation.

## Limitations

These come from BBEdit's codeless module format, not from Julia:

- Names with non-ASCII letters (`π`, `ℯ`, `∈`) aren't colored as predefined
  names, because the word-character set is ASCII. They work fine in the
  function menu.
- Since `!` counts as a word character (so `push!` is one word), `!isempty(x)`
  reads as a single unknown word and `isempty` isn't colored there.
- Numbers and operators aren't colored. The format has no way to define them.

## Files

- `Language Modules/Julia.plist`: the module.
- `install.sh`: copies it into BBEdit.
- `examples/demo.jl`: a file that touches each coloring rule, handy for
  checking the install.

## License

MIT. See `LICENSE`.
