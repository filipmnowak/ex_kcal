defmodule ExKcal.Units do
  @moduledoc """
  Various unit-related information, functions etc.
  """

  # TODO(fmn): can we import a type instead?
  defmacro __using__(_opts) do
    quote do
      # TODO(fmn):
      # - there should be a better way and/or a name. For reason I don't know, there is no non_neg_float(). Also, seems
      #   like there are no `float` literals for `@type` spec?
      # - units mentioned in types below, don't cover all of the allowed (for conversion) SI prefixes.
      @typedoc """
      Known SI prefixes.
      """
      @type si_prefix :: :Y | :Z | :E | :P | :T | :G | :M | :k | :h | :da | :d | :c | :m | :μ | :n | :p | :f | :a | :z | :y
      @typedoc """
      Weight of substance and unit it is represented in.
      """
      @type weight :: {float(), :kg | :g | :mg | :μg} | {nil, :none}
      @typedoc """
      Volume of substance and unit it is represented in.
      """
      @type volume :: {float(), :l | :dl | :ml} | {nil, :none}
    end
  end
end
