defmodule ExKcal.Fats do
  @moduledoc """
  Fats split into subcategories.
  """

  use ExKcal.Units

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
end
