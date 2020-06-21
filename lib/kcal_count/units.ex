defmodule KcalCount.Units do
  def prefixes() do
    [
      {"yotta", "Y", 1000000000000000000000000},
      {"zetta", "Z", 1000000000000000000000},
      {"exa", "E", 1000000000000000000},
      {"peta", "P", 1000000000000000},
      {"tera", "T", 1000000000000},
      {"giga", "G", 1000000000},
      {"mega", "M", 1000000},
      {"kilo", "k", 1000},
      {"hecto", "h", 100},
      {"deca",  "da", 10},
      {"deci", "d", 0.1},
      {"centi", "c", 0.01},
      {"milli", "m", 0.001},
      {"micro", "μ", 0.000001},
      {"nano", "n", 0.000000001},
      {"pico", "p", 0.000000000001},
      {"femto", "f", 0.000000000000001},
      {"atto", "a", 0.000000000000000001},
      {"zepto", "z", 0.000000000000000000001},
      {"yocto", "y", 0.000000000000000000000001},
    ]
  end
end
