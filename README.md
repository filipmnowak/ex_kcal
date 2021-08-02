# ExKcal

## Notes

This is exploratory, toy project, strange things in the code, too much emphasis on types etc.

## Installation

[Available in Hex](https://hex.pm/docs/publish); the package can be installed by adding `ex_kcal`
to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_kcal, "~> 0.0.6"}
  ]
end
```

## Examples

```elixir
iex>> alias ExKcal.Fats
ExKcal.Fats
iex>> alias ExKcal.Product
ExKcal.Product
iex>> alias ExKcal.Products
ExKcal.Products
iex>> import ExKcal.Calc
ExKcal.Calc
iex>> alias ExKcal.Recipe
ExKcal.Recipe
iex>> import Recipe
ExKcal.Recipe
iex>> alias ExKcal.Recipe.Step, as: RecipeStep
ExKcal.Recipe.Step
iex>> alias ExKcal.Recipe.Time, as: RecipeTime
ExKcal.Recipe.Time
iex>> 
nil
iex>> strange_apple = %Product{name: "strange apple",
...(10)>                         kcal: 301.0,
...(10)>                         amount: {100.0, :g},
...(10)>                         fats: %Fats{total: {4.0, :kg}}} |> adjust_amount({1.0, :kg})
%ExKcal.Product{
  alcohols: %ExKcal.Alcohols{
    ethanol: {nil, :none},
    other: {nil, :none},
    total: {nil, :none}
  },
  amount: {1.0, :kg},
  brand: "",
  carbs: %ExKcal.Carbs{
    dietary_fiber: {nil, :none},
    other: {nil, :none},
    starch: {nil, :none},
    sugars: {nil, :none},
    total: {nil, :none}
  },
  description: "",
  fats: %ExKcal.Fats{
    monounsaturated: {nil, :none},
    polyunsaturated: {nil, :none},
    saturated: {nil, :none},
    total: {40.0, :kg}
  },
  kcal: 3010.0,
  minerals: %ExKcal.Minerals{
    calcium: {nil, :none},
    chloride: {nil, :none},
    chromium: {nil, :none},
    copper: {nil, :none},
    fluoride: {nil, :none},
    iodide: {nil, :none},
    iodine: {nil, :none},
    iron: {nil, :none},
    magnesium: {nil, :none},
    manganese: {nil, :none},
    molybdenum: {nil, :none},
    phosphorus: {nil, :none},
    potassium: {nil, :none},
    selenium: {nil, :none},
    sodium: {nil, :none},
    sulfur: {nil, :none},
    zinc: {nil, :none}
  },
  name: "strange apple",
  note: "",
  origin: [],
  produced: [],
  producer: "",
  proteins: {nil, :none},
  salt: {nil, :none},
  vitamins: %ExKcal.Vitamins{
    choline: {nil, :none},
    vitamin_a: {nil, :none},
    vitamin_b1: {nil, :none},
    vitamin_b12: {nil, :none},
    vitamin_b2: {nil, :none},
    vitamin_b3: {nil, :none},
    vitamin_b4: {nil, :none},
    vitamin_b6: {nil, :none},
    vitamin_b9: {nil, :none},
    vitamin_c: {nil, :none},
    vitamin_d: {nil, :none},
    vitamin_e: {nil, :none},
    vitamin_k: {nil, :none}
  }
}
iex>
{:ok,
 %ExKcal.Products{
   map: %{
     %ExKcal.Product{
       alcohols: %ExKcal.Alcohols{
         ethanol: {nil, :none},
         other: {nil, :none},
         total: {nil, :none}
       },
       amount: {1.0, :kg},
       brand: "",
       carbs: %ExKcal.Carbs{
         dietary_fiber: {nil, :none},
         other: {nil, :none},
         starch: {nil, :none},
         sugars: {nil, :none},
         total: {nil, :none}
       },
       description: "",
       fats: %ExKcal.Fats{
         monounsaturated: {nil, :none},
         polyunsaturated: {nil, :none},
         saturated: {nil, :none},
         total: {40.0, :kg}
       },
       kcal: 3010.0,
       minerals: %ExKcal.Minerals{
         calcium: {nil, :none},
         chloride: {nil, :none},
         chromium: {nil, :none},
         copper: {nil, :none},
         fluoride: {nil, :none},
         iodide: {nil, :none},
         iodine: {nil, :none},
         iron: {nil, :none},
         magnesium: {nil, :none},
         manganese: {nil, :none},
         molybdenum: {nil, :none},
         phosphorus: {nil, :none},
         potassium: {nil, :none},
         selenium: {nil, :none},
         sodium: {nil, :none},
         sulfur: {nil, :none},
         zinc: {nil, :none}
       },
       name: "strange apple",
       note: "",
       origin: [],
       produced: [],
       producer: "",
       proteins: {nil, :none},
       salt: {nil, :none},
       vitamins: %ExKcal.Vitamins{
         choline: {nil, :none},
         vitamin_a: {nil, :none},
         vitamin_b1: {nil, :none},
         vitamin_b12: {nil, :none},
         vitamin_b2: {nil, :none},
         vitamin_b3: {nil, :none},
         vitamin_b4: {nil, :none},
         vitamin_b6: {nil, :none},
         vitamin_b9: {nil, :none},
         vitamin_c: {nil, :none},
         vitamin_d: {nil, :none},
         vitamin_e: {nil, :none},
         vitamin_k: {nil, :none}
       }
     } => nil
   }
 }}
iex>> step1 = %RecipeStep{time: %RecipeTime{minutes: 5, seconds: 10},
...(12)>                     instructions: "wash in cold water", products: products}
%ExKcal.Recipe.Step{
  instructions: "wash in cold water",
  notes: "",
  products: %ExKcal.Products{
    map: %{
      %ExKcal.Product{
        alcohols: %ExKcal.Alcohols{
          ethanol: {nil, :none},
          other: {nil, :none},
          total: {nil, :none}
        },
        amount: {1.0, :kg},
        brand: "",
        carbs: %ExKcal.Carbs{
          dietary_fiber: {nil, :none},
          other: {nil, :none},
          starch: {nil, :none},
          sugars: {nil, :none},
          total: {nil, :none}
        },
        description: "",
        fats: %ExKcal.Fats{
          monounsaturated: {nil, :none},
          polyunsaturated: {nil, :none},
          saturated: {nil, :none},
          total: {40.0, :kg}
        },
        kcal: 3010.0,
        minerals: %ExKcal.Minerals{
          calcium: {nil, :none},
          chloride: {nil, :none},
          chromium: {nil, :none},
          copper: {nil, :none},
          fluoride: {nil, :none},
          iodide: {nil, :none},
          iodine: {nil, :none},
          iron: {nil, :none},
          magnesium: {nil, :none},
          manganese: {nil, :none},
          molybdenum: {nil, :none},
          phosphorus: {nil, :none},
          potassium: {nil, :none},
          selenium: {nil, :none},
          sodium: {nil, :none},
          sulfur: {nil, :none},
          zinc: {nil, :none}
        },
        name: "strange apple",
        note: "",
        origin: [],
        produced: [],
        producer: "",
        proteins: {nil, :none},
        salt: {nil, :none},
        vitamins: %ExKcal.Vitamins{
          choline: {nil, :none},
          vitamin_a: {nil, :none},
          vitamin_b1: {nil, :none},
          vitamin_b12: {nil, :none},
          vitamin_b2: {nil, :none},
          vitamin_b3: {nil, :none},
          vitamin_b4: {nil, :none},
          vitamin_b6: {nil, :none},
          vitamin_b9: {nil, :none},
          vitamin_c: {nil, :none},
          vitamin_d: {nil, :none},
          vitamin_e: {nil, :none},
          vitamin_k: {nil, :none}
        }
      } => nil
    }
  },
  time: %ExKcal.Recipe.Time{hours: 0, minutes: 5, seconds: 10}
}
iex>> step2 = %RecipeStep{time: %RecipeTime{hours: 1}, instructions: "cook on medium heat"}
%ExKcal.Recipe.Step{
  instructions: "cook on medium heat",
  notes: "",
  products: %ExKcal.Products{map: %{}},
  time: %ExKcal.Recipe.Time{hours: 1, minutes: 0, seconds: 0}
}
iex>
%ExKcal.Recipe{
  steps: [
    %ExKcal.Recipe.Step{
      instructions: "wash in cold water",
      notes: "",
      products: %ExKcal.Products{
        map: %{
          %ExKcal.Product{
            alcohols: %ExKcal.Alcohols{
              ethanol: {nil, :none},
              other: {nil, :none},
              total: {nil, :none}
            },
            amount: {1.0, :kg},
            brand: "",
            carbs: %ExKcal.Carbs{
              dietary_fiber: {nil, :none},
              other: {nil, :none},
              starch: {nil, :none},
              sugars: {nil, :none},
              total: {nil, :none}
            },
            description: "",
            fats: %ExKcal.Fats{
              monounsaturated: {nil, :none},
              polyunsaturated: {nil, :none},
              saturated: {nil, :none},
              total: {40.0, :kg}
            },
            kcal: 3010.0,
            minerals: %ExKcal.Minerals{
              calcium: {nil, :none},
              chloride: {nil, :none},
              chromium: {nil, :none},
              copper: {nil, :none},
              fluoride: {nil, :none},
              iodide: {nil, :none},
              iodine: {nil, :none},
              iron: {nil, :none},
              magnesium: {nil, :none},
              manganese: {nil, :none},
              molybdenum: {nil, :none},
              phosphorus: {nil, :none},
              potassium: {nil, :none},
              selenium: {nil, :none},
              sodium: {nil, :none},
              sulfur: {nil, :none},
              zinc: {nil, :none}
            },
            name: "strange apple",
            note: "",
            origin: [],
            produced: [],
            producer: "",
            proteins: {nil, :none},
            salt: {nil, :none},
            vitamins: %ExKcal.Vitamins{
              choline: {nil, :none},
              vitamin_a: {nil, :none},
              vitamin_b1: {nil, :none},
              vitamin_b12: {nil, :none},
              vitamin_b2: {nil, :none},
              vitamin_b3: {nil, :none},
              vitamin_b4: {nil, :none}, 
              vitamin_b6: {nil, :none},
              vitamin_b9: {nil, :none},
              vitamin_c: {nil, :none},
              vitamin_d: {nil, :none},
              vitamin_e: {nil, :none},
              vitamin_k: {nil, :none}
            }
          } => nil
        }
      },
      time: %ExKcal.Recipe.Time{hours: 0, minutes: 5, seconds: 10}
    },
    %ExKcal.Recipe.Step{
      instructions: "cook on medium heat",
      notes: "",
      products: %ExKcal.Products{map: %{}},
      time: %ExKcal.Recipe.Time{hours: 1, minutes: 0, seconds: 0}
    }
  ]
}
iex>
%ExKcal.Product{
  alcohols: %ExKcal.Alcohols{
    ethanol: {nil, :none},
    other: {nil, :none},
    total: {nil, :none}
  },
  amount: {1.0, :kg},
  brand: "",
  carbs: %ExKcal.Carbs{
    dietary_fiber: {nil, :none},
    other: {nil, :none},
    starch: {nil, :none},
    sugars: {nil, :none},
    total: {nil, :none}
  },
  description: "",
  fats: %ExKcal.Fats{
    monounsaturated: {nil, :none},
    polyunsaturated: {nil, :none},
    saturated: {nil, :none},
    total: {40.0, :kg}
  },
  kcal: 3010.0,
  minerals: %ExKcal.Minerals{
    calcium: {nil, :none},
    chloride: {nil, :none},
    chromium: {nil, :none},
    copper: {nil, :none},
    fluoride: {nil, :none},
    iodide: {nil, :none},
    iodine: {nil, :none},
    iron: {nil, :none},
    magnesium: {nil, :none},
    manganese: {nil, :none},
    molybdenum: {nil, :none},
    phosphorus: {nil, :none},
    potassium: {nil, :none},
    selenium: {nil, :none},
    sodium: {nil, :none},
    sulfur: {nil, :none},
    zinc: {nil, :none}
  },
  name: "",
  note: "",
  origin: [],
  produced: [],
  producer: "",
  proteins: {nil, :none},
  salt: {nil, :none},
  vitamins: %ExKcal.Vitamins{
    choline: {nil, :none},
    vitamin_a: {nil, :none},
    vitamin_b1: {nil, :none},
    vitamin_b12: {nil, :none}, 
    vitamin_b2: {nil, :none},
    vitamin_b3: {nil, :none},
    vitamin_b4: {nil, :none},
    vitamin_b6: {nil, :none},
    vitamin_b9: {nil, :none},
    vitamin_c: {nil, :none},
    vitamin_d: {nil, :none},
    vitamin_e: {nil, :none},
    vitamin_k: {nil, :none}
  }
}
iex>
%ExKcal.Recipe.Time{hours: 1, minutes: 5, seconds: 10}
```

## Docs
Check [at Hex](https://hexdocs.pm/ex_kcal).
