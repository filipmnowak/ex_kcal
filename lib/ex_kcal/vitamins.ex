defmodule ExKcal.Vitamins do
  @moduledoc """
  Vitamins and related substances.
  """

  use ExKcal.Units

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

end
