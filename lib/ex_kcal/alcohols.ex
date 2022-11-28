defmodule ExKcal.Alcohols do
  @moduledoc """
  Describes various alcohols common and beverages and food.
  """

  alias ExKcal.Alcohols
  alias ExKcal.Helpers, as: H

  use ExKcal.Units

  @typedoc """
  Common alcohols expressed in `#{__MODULE__}.weight()`.
  """
  @type t :: %__MODULE__{total: weight(), ethanol: weight(), other: weight()}

  @derive Jason.Encoder
  defstruct(
    total: {nil, :none},
    ethanol: {nil, :none},
    other: {nil, :none}
  )

  def decode(map) when is_map(map) do
    struct!(
      Alcohols,
      %{
        total: H.decode(map.total),
        ethanol: H.decode(map.ethanol),
        other: H.decode(map.other)
      }
    )
  end

  def decode(string) do
    Jason.decode!(string, keys: :atoms!)
    |> decode()
  end
end
