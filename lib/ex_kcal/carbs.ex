defmodule ExKcal.Carbs do
  @moduledoc """
  Carbohydrates split into subcategories.
  """

  use ExKcal.Units

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

end
