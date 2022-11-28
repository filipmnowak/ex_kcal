defmodule ExKcal.Minerals do
  @moduledoc """
  Minerals and microelements split into subcategories.
  """

  alias ExKcal.Minerals
  alias ExKcal.Helpers, as: H

  use ExKcal.Units

  @typedoc """
  Common minerals and microelements.
  """
  @type t :: %__MODULE__{
          calcium: weight(),
          chloride: weight(),
          chromium: weight(),
          copper: weight(),
          fluoride: weight(),
          iodine: weight(),
          iodide: weight(),
          iron: weight(),
          magnesium: weight(),
          manganese: weight(),
          molybdenum: weight(),
          phosphorus: weight(),
          potassium: weight(),
          selenium: weight(),
          sodium: weight(),
          sulfur: weight(),
          zinc: weight()
        }

  @derive Jason.Encoder
  defstruct(
    calcium: {nil, :none},
    chloride: {nil, :none},
    chromium: {nil, :none},
    copper: {nil, :none},
    fluoride: {nil, :none},
    iodine: {nil, :none},
    iodide: {nil, :none},
    iron: {nil, :none},
    magnesium: {nil, :none},
    manganese: {nil, :none},
    molybdenum: {nil, :none},
    phosphorus: {nil, :none},
    potassium: {nil, :none},
    selenium: {nil, :none},
    sodium: {nil, :none},
    sulfur: {nil, :none},
    zinc: {nil, :none}
  )

  def decode(map) when is_map(map) do
    struct!(
      Minerals,
      %{
        calcium: H.decode(map.calcium),
        chloride: H.decode(map.chloride),
        chromium: H.decode(map.chromium),
        copper: H.decode(map.copper),
        fluoride: H.decode(map.fluoride),
        iodine: H.decode(map.iodine),
        iodide: H.decode(map.iodide),
        iron: H.decode(map.iron),
        magnesium: H.decode(map.magnesium),
        manganese: H.decode(map.manganese),
        molybdenum: H.decode(map.molybdenum),
        phosphorus: H.decode(map.phosphorus),
        potassium: H.decode(map.potassium),
        selenium: H.decode(map.selenium),
        sodium: H.decode(map.sodium),
        sulfur: H.decode(map.sulfur),
        zinc: H.decode(map.zinc)
      }
    )
  end

  def decode(string) do
    Jason.decode!(string, keys: :atoms!)
    |> decode()
  end
end
