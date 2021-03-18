defmodule ExKcal.Units do
  @moduledoc """
  Various unit-related information, functions etc.
  """

  # TODO(fmn): can/should we import a type instead?
  defmacro __using__(_opts) do
    quote do
      # TODO(fmn) there should be a better way and/or a name. For reason I don't know, there is no non_neg_float(). Also, seems
      # like there are no `float` literals for `@type` spec?
      @typedoc """
      Amount of substance and unit it is represented in.
      """
      @type weight :: {float(), :kg | :g | :mg | :μg} | {nil, :none}
      @type volume :: {float(), :l | :dl | :ml} | {nil, :none}
    end
  end

  @doc false
  @spec prefixes() :: list({String.t(), String.t(), number()})
  def prefixes() do
    [
      {"yotta", "Y", 1_000_000_000_000_000_000_000_000},
      {"zetta", "Z", 1_000_000_000_000_000_000_000},
      {"exa", "E", 1_000_000_000_000_000_000},
      {"peta", "P", 1_000_000_000_000_000},
      {"tera", "T", 1_000_000_000_000},
      {"giga", "G", 1_000_000_000},
      {"mega", "M", 1_000_000},
      {"kilo", "k", 1000},
      {"hecto", "h", 100},
      {"deca", "da", 10},
      {"deci", "d", 0.1},
      {"centi", "c", 0.01},
      {"milli", "m", 0.001},
      {"micro", "μ", 0.000001},
      {"nano", "n", 0.000000001},
      {"pico", "p", 0.000000000001},
      {"femto", "f", 0.000000000000001},
      {"atto", "a", 0.000000000000000001},
      {"zepto", "z", 0.000000000000000000001},
      {"yocto", "y", 0.000000000000000000000001}
    ]
  end
end
