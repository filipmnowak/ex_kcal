defmodule ExKcal.Carbs do
  @moduledoc """
  Carbohydrates split into subcategories.
  """

  alias ExKcal.Carbs
  alias ExKcal.Helpers, as: H

  use ExKcal.Units

  @derive Jason.Encoder
  defstruct(
    total: {nil, :none},
    starch: {nil, :none},
    other: {nil, :none},
    sugars: {nil, :none},
    dietary_fiber: {nil, :none}
  )

  @typedoc """
  Different types of carbs.
  """
  @type t :: %__MODULE__{
          total: weight(),
          starch: weight(),
          other: weight(),
          sugars: weight(),
          dietary_fiber: weight()
        }

  def decode(map) when is_map(map) do
    struct!(
      Carbs,
      %{
        total: H.decode(map.total),
        starch: H.decode(map.starch),
        other: H.decode(map.other),
        sugars: H.decode(map.sugars),
        dietary_fiber: H.decode(map.dietary_fiber)
      }
    )
  end

  def decode(string) when is_bitstring(string) do
    Jason.decode!(string, keys: :atoms!)
    |> decode()
  end
end
