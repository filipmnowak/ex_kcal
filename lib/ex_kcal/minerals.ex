defmodule ExKcal.Minerals do
  @moduledoc """
  Minerals and microelements split into subcategories.
  """

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
end
