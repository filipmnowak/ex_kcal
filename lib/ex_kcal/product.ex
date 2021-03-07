defmodule ExKcal.Product do

  use ExKcal.Units

  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Alcohols

  defstruct(
    kcal: 0.0,
    weight: {nil, :none},
    volume: {nil, :none},
    proteins: {nil, :none},
    carbs: %Carbs{},
    fats: %Fats{},
    vitamins: %Vitamins{},
    minerals: %Minerals{},
    alcohols: %Alcohols{},
    salt: {nil, :none},
    name: "",
    description: "",
    note: "",
    brand: "",
    producer: "",
    produced: [],
    origin: []
  )

  @typedoc """
  Struct representing single product. Base unit for `ExKcal.Products`.
  """
  @type t :: %__MODULE__{
    kcal: float(),
    weight: weight(),
    volume: volume(),
    proteins: weight(),
    carbs: Carbs.t(),
    fats: Fats.t(),
    vitamins: Vitamins.t(),
    minerals: Minerals.t(),
    alcohols: Alcohols.t(),
    salt: weight(),
    name: String.t(),
    description: String.t(),
    note: String.t(),
    brand: String.t(),
    producer: String.t(),
    produced: list(String.t()),
    origin: list(String.t())
  }

end
