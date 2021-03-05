defmodule ExKcal.Alcohols do

  defstruct(
    total: 0,
    ethanol: 0,
    other: 0
  )

  @type t :: %__MODULE__{total: non_neg_integer(), ethanol: non_neg_integer(), other: non_neg_integer()}

end
