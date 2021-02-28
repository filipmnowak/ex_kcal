defmodule KcalCount.Product do

  alias KcalCount.Carbs
  alias KcalCount.Fats
  alias KcalCount.Vitamins
  alias KcalCount.Minerals
  alias KcalCount.Alcohols

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
