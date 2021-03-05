defmodule ExKcal.Minerals do

  defstruct(
    calcium: 0,
    chloride: 0,
    chromium: 0,
    copper: 0,
    fluoride: 0,
    iodine: 0,
    iodide: 0,
    iron: 0,
    magnesium: 0,
    manganese: 0,
    molybdenum: 0,
    phosphorus: 0,
    potassium: 0,
    selenium: 0,
    sodium: 0,
    sulfur: 0,
    zinc: 0
  )

  @type t :: %__MODULE__{
    calcium: non_neg_integer(),
    chloride: non_neg_integer(),
    chromium: non_neg_integer(),
    copper: non_neg_integer(),
    fluoride: non_neg_integer(),
    iodine: non_neg_integer(),
    iodide: non_neg_integer(),
    iron: non_neg_integer(),
    magnesium: non_neg_integer(),
    manganese: non_neg_integer(),
    molybdenum: non_neg_integer(),
    phosphorus: non_neg_integer(),
    potassium: non_neg_integer(),
    selenium: non_neg_integer(),
    sodium: non_neg_integer(),
    sulfur: non_neg_integer(),
    zinc: non_neg_integer()
  }

end
