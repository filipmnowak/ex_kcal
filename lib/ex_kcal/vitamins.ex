defmodule ExKcal.Vitamins do
  @moduledoc """
  Vitamins and related substances.
  """

  alias ExKcal.Vitamins
  alias ExKcal.Helpers, as: H

  use ExKcal.Units

  @typedoc """
  Varuiys vitamins and related substances.
  """
  @type t :: %__MODULE__{
          vitamin_a: weight(),
          vitamin_b1: weight(),
          vitamin_b2: weight(),
          vitamin_b3: weight(),
          vitamin_b4: weight(),
          vitamin_b6: weight(),
          vitamin_b12: weight(),
          vitamin_c: weight(),
          choline: weight(),
          vitamin_d: weight(),
          vitamin_e: weight(),
          vitamin_b9: weight(),
          vitamin_k: weight()
        }

  @derive Jason.Encoder
  defstruct(
    vitamin_a: {nil, :none},
    vitamin_b1: {nil, :none},
    vitamin_b2: {nil, :none},
    vitamin_b3: {nil, :none},
    vitamin_b4: {nil, :none},
    vitamin_b6: {nil, :none},
    vitamin_b12: {nil, :none},
    vitamin_c: {nil, :none},
    choline: {nil, :none},
    vitamin_d: {nil, :none},
    vitamin_e: {nil, :none},
    vitamin_b9: {nil, :none},
    vitamin_k: {nil, :none}
  )

  def decode(map) when is_map(map) do
    struct!(
      Vitamins,
      %{
        vitamin_a: H.decode(map.vitamin_a),
        vitamin_b1: H.decode(map.vitamin_b1),
        vitamin_b2: H.decode(map.vitamin_b2),
        vitamin_b3: H.decode(map.vitamin_b3),
        vitamin_b4: H.decode(map.vitamin_b4),
        vitamin_b6: H.decode(map.vitamin_b6),
        vitamin_b12: H.decode(map.vitamin_b12),
        vitamin_c: H.decode(map.vitamin_c),
        choline: H.decode(map.choline),
        vitamin_d: H.decode(map.vitamin_d),
        vitamin_e: H.decode(map.vitamin_e),
        vitamin_b9: H.decode(map.vitamin_b9),
        vitamin_k: H.decode(map.vitamin_k)
      }
    )
  end

  def decode(string) when is_bitstring(string) do
    Jason.decode!(string, keys: :atoms!)
    |> decode()
  end
end
