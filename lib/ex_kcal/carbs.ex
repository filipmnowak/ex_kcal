defmodule ExKcal.Carbs do

  defstruct(
    total: 0,
    starch: 0,
    other: 0,
    sugars: 0,
    dietary_fiber: 0
  )

  @type t :: %__MODULE__{
    total: non_neg_integer(),
    starch: non_neg_integer(),
    other: non_neg_integer(),
    sugars: non_neg_integer(),
    dietary_fiber: non_neg_integer
  }

end
