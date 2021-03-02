defmodule ExKcal.Product do

  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Alcohols

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
