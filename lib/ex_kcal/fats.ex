defmodule ExKcal.Fats do

  defstruct(
    total: 0,
    saturated: 0,
    monounsaturated: 0,
    polyunsaturated: 0
  )

  @type t :: %__MODULE__{total: non_neg_integer(), saturated: non_neg_integer(), monounsaturated: non_neg_integer(), polyunsaturated: non_neg_integer()}

end
