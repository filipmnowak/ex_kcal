defmodule ExKcal.Data do
  alias ExKcal.Product, as: Product
  alias ExKcal.Carbs, as: Carbs
  alias ExKcal.Fats, as: Fats
  alias ExKcal.Minerals, as: Minerals

  @products [
    %Product{
      kcal: 729.0,
      amount: {100.0, :g},
      proteins: {11.0, :g},
      carbs: %Carbs{
        total: {4.4, :g}
      },
      dietary_fiber: {9.5, :g},
      fats: %Fats{
        total: {72.0, :g},
        saturated: {5.5, :g}
      },
      name: "Bio Pekannüsse",
      note: "Organic",
      brand: "Coop Naturplan",
      producer: "HALBA",
      produced: [:switzerland],
      origin: [:mexico]
    },
    %Product{
      kcal: 363.0,
      amount: {100.0, :g},
      proteins: {21.0, :g},
      carbs: %Carbs{
        total: {17.0, :g}
      },
      dietary_fiber: {38.0, :g},
      fats: %Fats{
        total: {15.0, :g},
        saturated: {15.0, :g}
      },
      name: "Bio Kokosmehl",
      note: "Fairtrade, organic",
      brand: "Coop Naturplan",
      producer: "Morga AG",
      produced: [:switzerland],
      origin: [:srilanka]
    },
    %Product{
      kcal: 652.0,
      amount: {100.0, :g},
      proteins: {7.7, :g},
      carbs: %Carbs{
        total: {21.0, :g}
      },
      dietary_fiber: {12.0, :g},
      fats: %Fats{
        total: {57.0, :g},
        saturated: {35.0, :g}
      },
      name: "Chocolat Noir 87% De Cacao Trinitario",
      note: "Fairtrade, organic",
      brand: "Coop Naturplan",
      producer: "Chocolats Halba",
      produced: [:switzerland],
      origin: [:honduras]
    },
    %Product{
      kcal: 385.0,
      amount: {100.0, :g},
      proteins: {15.0, :g},
      carbs: %Carbs{
        total: {50.0, :g}
      },
      dietary_fiber: {13.0, :g},
      fats: %Fats{
        total: {11.0, :g},
        saturated: {1.8, :g}
      },
      minerals: %Minerals{
        iron: {5.2, :mg},
        magnesium: {176.0, :mg}
      },
      salt: {0.18, :g},
      name: "Schweizer Müesli",
      brand: "Bio Campiuns",
      producer: "E. Zwicky AG",
      produced: [:switzerland],
      origin: [:switzerland]
    },
    %Product{
      kcal: 610.0,
      amount: {100.0, :g},
      proteins: {18.0, :g},
      carbs: %Carbs{
        total: {12.0, :g},
        sugars: {10.0, :g}
      },
      fats: %Fats{
        total: {52.0, :g},
        saturated: {6.1, :g}
      },
      minerals: %Minerals{
        iron: {5.2, :mg},
        magnesium: {176.0, :mg}
      },
      salt: {0.03, :g},
      name: "Grüne Pistazienkerne",
      description: "pistachio nuts green, shelled",
      brand: "Seeberger",
      producer: "Seeberger GmbH",
      produced: [:germany],
      origin: [:iran]
    },
    %Product{
      kcal: 562.0,
      amount: {100.0, :g},
      proteins: {22.0, :g},
      carbs: %Carbs{
        total: {5.9, :g},
        sugars: {2.6, :g}
      },
      dietary_fiber: {18.0, :g},
      fats: %Fats{
        total: {46.0, :g},
        saturated: {4.6, :g}
      },
      minerals: %Minerals{
        iron: {6.9, :mg},
        magnesium: {356.0, :mg},
        zinc: {6.3, :mg}
      },
      salt: {0.03, :g},
      name: "Kernenmix",
      description: "Melange De Graines",
      note:
        "nutrition data found at https://www.coop.ch/de/maert/suesses-snacks/snacks/naturaplan-bio-campiuns-kernen-mix/p/6096991#tab=product-nutritions. from same page PDF with slightly different info is linked: https://www.coop.ch/content/dam/Naturaplan_2018/Gut/bio-campiuns/naehrwerte-kernenmix-naturaplan-bio-campiuns.pdf.",
      brand: "Bio Campiuns",
      producer: "Biofarm Genossenschaft",
      produced: [:switzerland],
      origin: [:switzerland]
    },
    %Product{
      kcal: 683.0,
      amount: {100.0, :g},
      proteins: {1.5, :g},
      carbs: %Carbs{
        total: {2.5, :g},
        sugars: {1.0, :g}
      },
      fats: %Fats{
        total: {74.0, :g},
        saturated: {8.0, :g}
      },
      salt: {1.4, :g},
      name: "Mayonnaise Suisse",
      description: "Schweizer Mayonnaise",
      brand: "Hugo",
      producer: "Reitzel SA",
      produced: [:switzerland],
      origin: [:switzerland]
    },
    %Product{
      kcal: 236.0,
      amount: {100.0, :g},
      proteins: {17.5, :g},
      fats: %Fats{
        total: {18.4, :g},
        saturated: {4.6, :g},
        monounsaturated: {9.3, :g},
        polyunsaturated: {4.5, :g}
      },
      salt: {1.2, :g},
      name: "Mackerel Fillets",
      description: "Grilled, Natural",
      brand: "Rio Mare",
      producer: "Bolton Alimentari S.p.A",
      produced: [:italy]
    },
    %Product{
      kcal: 189.0,
      amount: {100.0, :g},
      proteins: {1.2, :g},
      carbs: %Carbs{
        total: {2.2, :g},
        sugars: {0.4, :g}
      },
      dietary_fiber: {2.0, :g},
      fats: %Fats{
        total: {19.0, :g},
        saturated: {2.7, :g}
      },
      salt: {2.3, :g},
      name: "Grüne Oliven Entsteint",
      description: "Pitted Green Olives In Brine",
      brand: "creSpo",
      producer: "Somia S.A.",
      produced: [:morocco]
    },
    %Product{
      kcal: 45.0,
      amount: {100, :ml},
      carbs: %Carbs{
        total: {9.0, :g},
        sugars: {1, :g}
      },
      fats: %Fats{
        total: {1.0, :g}
      },
      name: "Karma Bio Reis-Drink Nature",
      note: "Vegan, no sugar added, UHT, bio.",
      brand: "Coop Karma",
      producer: "Primefood SA",
      produced: [:switzerland, :italy],
      origin: [:italy]
    },
    %Product{
      kcal: 655.0,
      amount: {100, :g},
      carbs: %Carbs{
        total: {6.5, :g},
        sugars: {6.0, :g}
      },
      dietary_fiber: {14.0, :g},
      fats: %Fats{
        total: {64, :g},
        saturated: {55.0, :g}
      },
      proteins: {6.3, :g},
      salt: {0.08, :g},
      name: "Naturaplan Bio Fairtrade Kokosschnitze",
      note: "Vegan, bio.",
      brand: "Coop naturaplan",
      producer: "Sunray",
      produced: [:switzerland, :ghana],
      origin: [:ghana]
    },
    %Product{
      kcal: 331.0,
      amount: {100.0, :g},
      proteins: {3.3, :g},
      carbs: %Carbs{
        total: {69.0, :g},
        sugars: {67.0, :g}
      },
      dietary_fiber: {9.4, :g},
      fats: %Fats{
        total: {2.5, :g},
        saturated: {0.6, :g}
      },
      salt: {0.07, :g},
      name: "Fairtrade Mango",
      note: "Vegan, organic.",
      brand: "Coop Naturplan",
      producer: "Sunray",
      produced: [:switzerland, :burkinafaso],
      origin: [:burkinafaso]
    },
    %Product{
      kcal: 396.0,
      amount: {100.0, :g},
      proteins: {27.0, :g},
      fats: %Fats{
        total: {32.0, :g},
        saturated: {19.0, :g}
      },
      salt: {1.5, :g},
      name: "Mild Gruyère",
      note: "Organic",
      brand: "Coop Naturplan",
      producer: "Emmi Schweiz AG",
      produced: [:switzerland],
      origin: [:switzerlGand]
    },
    %Product{
      kcal: 230.0,
      amount: {100.0, :g},
      proteins: {8.3, :g},
      carbs: %Carbs{
        total: {43.0, :g},
        sugars: {3.7, :g}
      },
      dietary_fiber: {2.4, :g},
      fats: %Fats{
        total: {2.2, :g},
        saturated: {0.6, :g}
      },
      salt: {1.4, :g},
      name: "Toast",
      note:
        "21 Scheiben; E471, E481, E282, E300; https://www.coop.ch/de/lebensmittel/brot-backwaren/haltbare-brote/toastbrote-buns/prix-garantie-toast-21-scheiben/p/3735237",
      brand: "Prix Garantie",
      produced: [:austria]
    },
    %Product{
      kcal: 25.0,
      amount: {100.0, :g},
      proteins: {1.5, :g},
      carbs: %Carbs{
        total: {5.5, :g},
        sugars: {4.0, :g}
      },
      dietary_fiber: {1.5, :g},
      salt: {0.1, :g},
      name: "Strained Tomatoes",
      description: "Passata Di Pomodoro",
      note: "Organic",
      brand: "Coop Naturplan",
      producer: "Buonvicini AG",
      produced: [:italy],
      origin: [:italy]
    },
    %Product{
      kcal: 332.0,
      amount: {100.0, :mg},
      proteins: {24.5, :g},
      carbs: %Carbs{
        total: {61.4, :g},
        sugars: {1.67, :g}
      },
      dietary_fiber: {16.1, :g},
      fats: %Fats{
        total: {1.54, :g},
        saturated: {0.265, :g}
      },
      salt: {0.02, :g},
      name: "Saint-Flour Blond Lentils",
      note:
        "no nutrition facts at https://www.coop.ch/en/food/inventories/staples/grains-corn-semolina/lentils-beans-grains/slow-food-st-flour-blond-lentils/p/3614306, taken from https://world.openfoodfacts.org/category/en:blonde-lentils.",
      brand: "Slow Food",
      produced: [:france],
      origin: [:france]
    },
    %Product{
      kcal: 172.0,
      amount: {100.0, :ml},
      proteins: {1.3, :g},
      carbs: %Carbs{
        total: {2.4, :g},
        sugars: {1.7, :g}
      },
      fats: %Fats{
        total: {17.4, :g},
        saturated: {14.1, :g}
      },
      salt: {0.06, :g},
      name: "Coconut Milk",
      note: "UHT",
      brand: "Thai Kitchen",
      producer: "McCormick France SAS",
      produced: [:thailand],
      origin: [:thailand]
    }
  ]

  def products() do
    @products
  end
end
