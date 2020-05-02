defmodule KcalCount.Product do

  alias KcalCount.Carbs, as: Carbs
  alias KcalCount.Fats, as: Fats
  alias KcalCount.Vitamins, as: Vitamins
  alias KcalCount.Minerals, as: Minerals
  alias KcalCount.Alcohols, as: Alcohols

  defstruct(
    kcal: 0,
    weigth: 0,
    volume: 0,
    proteins: 0,
    carbs: %Carbs{},
    fats: %Fats{},
    vitamins: %Vitamins{},
    minerals: %Minerals{},
    alcohol: %Alcohols{},
    salt: 0,
    name: "",
    description: "",
    note: "",
    brand: "",
    producer: ""
  )

end
