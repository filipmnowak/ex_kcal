defmodule ExKcal.Alcohols do
  @moduledoc """
  Describes various alcohols common and beverages and food.
  """

  use ExKcal.Units

  defstruct(
    total: {nil, :none},
    ethanol: {nil, :none},
    other: {nil, :none}
  )

  @typedoc """
  Common alcohols expressed in `#{__MODULE__}.weight()`.
  """
  @type t :: %__MODULE__{total: weight(), ethanol: weight(), other: weight()}
end
