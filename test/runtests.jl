using TimeAxisArrays
using Base.Test
using Base.Dates

n = now()

A1d1 = TimeAxisArray(randn(11), n-Hour(2):Hour(1):n+Hour(8))
A1d2 = TimeAxisArray(randn(5), n-Hour(2):Hour(1):n+Hour(2))
@test isa(A1d1, RegularTimeAxisArray)

data = randn(5,2)
A2d1 = TimeAxisArray(data, n-Hour(2):Hour(1):n+Hour(2),
                         Axis{:Columns}([:A, :B]))
A2d2 = TimeAxisArray(data, n-Hour(2):Hour(1):n+Hour(2), [:A, :B])
@test isa(A2d1, RegularTimeAxisArray)
@test A2d1 == A2d2

A3d = TimeAxisArray(randn(7,2,3), n-Day(1):Hour(8):n+Day(1),
              Axis{:Columns}([:A, :B]),
              Axis{:Pages}([:I, :II, :III]))
@test isa(A3d, RegularTimeAxisArray)

A4d = TimeAxisArray(randn(49,2,5,3), n-Day(1):Hour(1):n+Day(1),
              Axis{:Columns}([:A, :B]),
              Axis{:Pages}([:I, :II, :III, :IV, :V]),
              Axis{:Superpages}([:one, :two, :three]))
@test isa(A4d, RegularTimeAxisArray)

include("io.jl")
