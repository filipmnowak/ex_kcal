defmodule KcalCount.Data do
  alias KcalCount.Product, as: Product
  alias KcalCount.Carbs, as: Carbs
  alias KcalCount.Fats, as: Fats
  alias KcalCount.Vitamins, as: Vitamins
  alias KcalCount.Minerals, as: Minerals
  alias KcalCount.Alcohols, as: Alcohols

  @products [
    %Product{
      kcal: 385,
      weigth: 100,
      volume: 0,
      proteins: 15,
      carbs: %Carbs{
        total: 50,
        dietary_fiber: 13},
      fats: %Fats{
        total: 11,
        saturated: 1.8
      },
      vitamins: %Vitamins{
      },
      minerals: %Minerals{
        iron: 5.2,
        magnesium: 176
      },
      alcohols: %Alcohols{},
      salt: 0.18,
      name: "Bio Campinus Schweizer Müesli",
      description: "",
      note: "",
      brand: "Bio Campinus",
      producer: "E. Zwicky AG",
      produced: [:switzerland],
      origin: [:switzerland]
    },
    %Product{
      kcal: 615,
      weigth: 100,
      volume: 0,
      proteins: 21,
      carbs: %Carbs{
        total: 12,
        sugars: 2.3},
      fats: %Fats{
        total: 52,
        saturated: 6.1
      },
      vitamins: %Vitamins{
      },
      minerals: %Minerals{
        iron: 5.2,
        magnesium: 176
      },
      alcohols: %Alcohols{},
      salt: 0.02,
      name: "Grüne Pistazienkerne",
      description: "pistachio nuts green, shelled",
      note: "",
      brand: "Seeberger",
      producer: "Seeberger GmbH",
      produced: [:germany],
      origin: [:iran],
    },
    %Product{
      kcal: 615,
      weigth: 100,
      volume: 0,
      proteins: 21,
      carbs: %Carbs{
        total: 12,
        sugars: 2.3},
      fats: %Fats{
        total: 52,
        saturated: 6.1
      },
      vitamins: %Vitamins{
      },
      minerals: %Minerals{
        iron: 5.2,
        magnesium: 176
      },
      alcohols: %Alcohols{},
      salt: 0.02,
      name: "Grüne Pistazienkerne",
      description: "pistachio nuts green, shelled",
      note: "",
      brand: "Seeberger",
      producer: "Seeberger GmbH",
      produced: [:germany],
      origin: [:iran],
    },
  ]

  def products() do
    @products
  end
end
