#= Nested #= block =# comments
   still a comment =#
module Demo

using LinearAlgebra
export Point, norm2, @twice

"""
    Point{T}

A point with a "quoted" word and $(interpolation) in its docstring.
"""
struct Point{T<:Real} <: AbstractVector{T}
    x::T
    y::T
end

Base.@kwdef mutable struct Settings
    verbose::Bool = false   # trailing comment with "quotes"
    name::String = "default"
end

abstract type Shape end

function norm2(p::Point)
    s = sqrt(p.x^2 + p.y^2)
    if s > 1
        println("big: $(round(s, digits = 2)) and $(join(["a", "b"], ", ")) ok")
    end
    return s
end

@inline area(r::Real) = π * r^2
Base.show(io::IO, p::Point) = print(io, "Point(", p.x, ", ", p.y, ")")
dot3(a, b; scale = 1) where {T} = scale * dot(a, b)

macro twice(ex)
    quote
        $(esc(ex)); $(esc(ex))
    end
end

function emptyfn end

A = [1 2; 3 4]'
c = 'x'; nl = '\n'; u = 'é'
r = r"^\d+\.(jl|md)$"
cmd = `ls -la $(pwd())`
xs = filter!(x -> x != 0, collect(1:10))
y == 3 && push!(xs, 4)
x .= 2
@time sum(A)

end # module
