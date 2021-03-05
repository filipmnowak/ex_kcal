defmodule ExKcal.Vitamins do

  defstruct(
    vitamin_a: 0,
    vitamin_b1: 0,
    vitamin_b2: 0,
    vitamin_b3: 0,
    vitamin_b4: 0,
    vitamin_b6: 0,
    vitamin_b12: 0,
    vitamin_c: 0,
    choline: 0,
    vitamin_d: 0,
    vitamin_e: 0,
    vitamin_b9: 0,
    vitamin_k: 0
  )

  @type t :: %__MODULE__{
    vitamin_a: non_neg_integer(),
    vitamin_b1: non_neg_integer(),
    vitamin_b2: non_neg_integer(),
    vitamin_b3: non_neg_integer(),
    vitamin_b4: non_neg_integer(),
    vitamin_b6: non_neg_integer(),
    vitamin_b12: non_neg_integer(),
    vitamin_c: non_neg_integer(),
    choline: non_neg_integer(),
    vitamin_d: non_neg_integer(),
    vitamin_e: non_neg_integer(),
    vitamin_b9: non_neg_integer(),
    vitamin_k: non_neg_integer()
  }

end
