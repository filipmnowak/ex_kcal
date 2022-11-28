defmodule ExKcal.Fats do
  @moduledoc """
  Fats split into subcategories.
  """

  alias ExKcal.Fats
  alias ExKcal.Helpers, as: H

  use ExKcal.Units

  @derive Jason.Encoder
  defstruct(
    total: {nil, :none},
    saturated: {nil, :none},
    monounsaturated: {nil, :none},
    polyunsaturated: {nil, :none}
  )

  @typedoc """
  Amounts of different fat types.
  """
  @type t :: %__MODULE__{
          total: weight(),
          saturated: weight(),
          monounsaturated: weight(),
          polyunsaturated: weight()
        }
  def decode(map) when is_map(map) do
    struct!(
      Fats,
      %{
        total: H.decode(map.total),
        saturated: H.decode(map.saturated),
        monounsaturated: H.decode(map.monounsaturated),
        polyunsaturated: H.decode(map.polyunsaturated),
      }
    )
  end

  def decode(string) do
    Jason.decode!(string, keys: :atoms!)
    |> decode()
  end
end
