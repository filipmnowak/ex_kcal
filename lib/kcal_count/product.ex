defmodule KcalCount.Product do

  alias KcalCount.Carbs, as: Carbs
  alias KcalCount.Fats, as: Fats

  defstruct(
    kcal: 0,
    weigth: 0,
    proteins: 0,
    carbs: %Carbs{},
    fats: %Fats{},
    name: "",
    brand: "",
    producer: ""
  )

end
