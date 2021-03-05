defmodule ExKcal.Product do

  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Alcohols
  alias ExKcal.Product

  @type t :: %__MODULE__{
    kcal: integer(),
    weigth: non_neg_integer(),
    volume: non_neg_integer(),
    proteins: non_neg_integer(),
    carbs: Carbs.t(),
    fats: Fats.t(),
    vitamins: Vitamins.t(),
    minerals: Minerals.t(),
    alcohols: Alcohols.t(),
    salt: non_neg_integer(),
    name: String.t(),
    description: String.t(),
    note: String.t(),
    brand: String.t(),
    producer: String.t(),
    produced: list(String.t()),
    origin: list(String.t())
  }

  defstruct(
    kcal: 0,
    weigth: 0,
    volume: 0,
    proteins: 0,
    carbs: %Carbs{},
    fats: %Fats{},
    vitamins: %Vitamins{},
    minerals: %Minerals{},
    alcohols: %Alcohols{},
    salt: 0,
    name: "",
    description: "",
    note: "",
    brand: "",
    producer: "",
    produced: [],
    origin: []
  )

end
