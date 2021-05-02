defmodule ExKcal.SITest do
  use ExUnit.Case, async: true
  doctest ExKcal.SI

  test "Check ExKcal.SI.prefixes()" do
    expected = [
      {:yotta, :Y, 1000000000000000000000000},
      {nil, nil, 100000000000000000000000},
      {nil, nil, 10000000000000000000000},
      {:zetta, :Z, 1000000000000000000000},
      {nil, nil, 100000000000000000000},
      {nil, nil, 10000000000000000000},
      {:exa, :E, 1000000000000000000},
      {nil, nil, 100000000000000000},
      {nil, nil, 10000000000000000},
      {:peta, :P, 1000000000000000},
      {nil, nil, 100000000000000},
      {nil, nil, 10000000000000},
      {:tera, :T, 1000000000000},
      {nil, nil, 100000000000},
      {nil, nil, 10000000000},
      {:giga, :G, 1000000000},
      {nil, nil, 100000000},
      {nil, nil, 10000000},
      {:mega, :M, 1000000},
      {nil, nil, 100000},
      {nil, nil, 10000},
      {:kilo, :k, 1000},
      {:hecto, :h, 100},
      {:deca, :da, 10},
      {:none, :none, 1},
      {:deci, :d, 0.1},
      {:centi, :c, 0.01},
      {:milli, :m, 0.001},
      {nil, nil, 0.0001},
      {nil, nil, 1.0e-5},
      {nil, nil, 1.0e-6},
      {nil, nil, 1.0e-7},
      {nil, nil, 1.0e-8},
      {:nano, :n, 1.0e-9},
      {nil, nil, 1.0e-10},
      {nil, nil, 1.0e-11},
      {:pico, :p, 1.0e-12},
      {nil, nil, 1.0e-13},
      {nil, nil, 1.0e-14},
      {:femto, :f, 1.0e-15},
      {nil, nil, 1.0e-16},
      {nil, nil, 1.0e-17},
      {:atto, :a, 1.0e-18},
      {nil, nil, 1.0e-19},
      {nil, nil, 1.0e-20},
      {:zepto, :z, 1.0e-21},
      {nil, nil, 1.0e-22},
      {nil, nil, 1.0e-23},
      {:yocto, :y, 1.0e-24}
    ]

    assert ExKcal.SI.prefixes() === expected
  end

end
