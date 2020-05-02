defmodule KcalCount.Product do

  alias KcalCount.Carbs, as: Carbs
  alias KcalCount.Fats, as: Fats
  alias KcalCount.Vitamins, as: Vitamins
  alias KcalCount.Minerals, as: Minerals

  defstruct(
    kcal: 0,
    weigth: 0,
    proteins: 0,
    carbs: %Carbs{},
    fats: %Fats{},
    vitamins: %Vitamins{},
    minerals: %Minerals{},
    name: "",
    description: "",
    note: ""
    brand: "",
    producer: ""
  )

end
