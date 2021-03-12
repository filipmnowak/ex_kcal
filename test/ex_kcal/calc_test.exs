defmodule ExKcal.CalcTest do
  use ExUnit.Case, async: true
  doctest ExKcal.Calc

  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Alcohols
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Calc

  test "Check ExKcal.Calc.adjust_by_weight() for correct adjustments" do
    carxadopadolarinamodopehaphilaton = %Product{
      alcohols: %Alcohols{
        ethanol: {100, :g},
        other: {100, :g},
        total: {200, :g}
      },
      brand: "",
      carbs: %Carbs{
        dietary_fiber: {nil, :none},
        other: {nil, :none},
        starch: {nil, :none},
        sugars: {nil, :none},
        total: {nil, :none}
      },
      description: "",
      fats: %Fats{
        monounsaturated: {1, :g},
        polyunsaturated: {2, :g},
        saturated: {3, :g},
        total: {6, :g}
      },
      kcal: 1_023_552.0,
      minerals: %Minerals{
        calcium: {nil, :none},
        chloride: {nil, :none},
        chromium: {1.0, :mg},
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
      name: "carxadopadolarinamodopehaphilaton",
      note: "",
      origin: [:planet_zordax13],
      produced: [],
      producer: "",
      proteins: {nil, :none},
      salt: {nil, :none},
      vitamins: %Vitamins{
        choline: {42.2, :mg},
        vitamin_a: {nil, :none},
        vitamin_b1: {nil, :none},
        vitamin_b12: {nil, :none},
        vitamin_b2: {nil, :none},
        vitamin_b3: {nil, :none},
        vitamin_b4: {nil, :none},
        vitamin_b6: {nil, :none},
        vitamin_b9: {nil, :none},
        vitamin_c: {48_213_457.0, :g},
        vitamin_d: {nil, :none},
        vitamin_e: {nil, :none},
        vitamin_k: {nil, :none}
      },
      volume: {nil, :none},
      weight: {125.0, :g}
    }

    adjustments_and_expected_results = [
      {
        200,
        %ExKcal.Product{
          alcohols: %ExKcal.Alcohols{
            ethanol: {160.0, :g},
            other: {160.0, :g},
            total: {320.0, :g}
          },
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
            monounsaturated: {1.6, :g},
            polyunsaturated: {3.2, :g},
            saturated: {4.800000000000001, :g},
            total: {9.600000000000001, :g}
          },
          kcal: 1_637_683.2000000002,
          minerals: %ExKcal.Minerals{
            calcium: {nil, :none},
            chloride: {nil, :none},
            chromium: {1.6, :mg},
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
          name: "carxadopadolarinamodopehaphilaton",
          note: "",
          origin: [:planet_zordax13],
          produced: [],
          producer: "",
          proteins: {nil, :none},
          salt: {nil, :none},
          vitamins: %ExKcal.Vitamins{
            choline: {67.52000000000001, :mg},
            vitamin_a: {nil, :none},
            vitamin_b1: {nil, :none},
            vitamin_b12: {nil, :none},
            vitamin_b2: {nil, :none},
            vitamin_b3: {nil, :none},
            vitamin_b4: {nil, :none},
            vitamin_b6: {nil, :none},
            vitamin_b9: {nil, :none},
            vitamin_c: {77_141_531.2, :g},
            vitamin_d: {nil, :none},
            vitamin_e: {nil, :none},
            vitamin_k: {nil, :none}
          },
          volume: {nil, :none},
          weight: {200, :g}
        }
      },
      {
        34,
        %ExKcal.Product{
          alcohols: %ExKcal.Alcohols{
            ethanol: {27.200000000000003, :g},
            other: {27.200000000000003, :g},
            total: {54.400000000000006, :g}
          },
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
            monounsaturated: {0.272, :g},
            polyunsaturated: {0.544, :g},
            saturated: {0.8160000000000001, :g},
            total: {1.6320000000000001, :g}
          },
          kcal: 278_406.14400000003,
          minerals: %ExKcal.Minerals{
            calcium: {nil, :none},
            chloride: {nil, :none},
            chromium: {0.272, :mg},
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
          name: "carxadopadolarinamodopehaphilaton",
          note: "",
          origin: [:planet_zordax13],
          produced: [],
          producer: "",
          proteins: {nil, :none},
          salt: {nil, :none},
          vitamins: %ExKcal.Vitamins{
            choline: {11.478400000000002, :mg},
            vitamin_a: {nil, :none},
            vitamin_b1: {nil, :none},
            vitamin_b12: {nil, :none},
            vitamin_b2: {nil, :none},
            vitamin_b3: {nil, :none},
            vitamin_b4: {nil, :none},
            vitamin_b6: {nil, :none},
            vitamin_b9: {nil, :none},
            vitamin_c: {13_114_060.304000001, :g},
            vitamin_d: {nil, :none},
            vitamin_e: {nil, :none},
            vitamin_k: {nil, :none}
          },
          volume: {nil, :none},
          weight: {34, :g}
        }
      }
    ]

    Enum.each(
      adjustments_and_expected_results,
      fn {adjustment, result} ->
        assert result == Calc.adjust_by_weight(carxadopadolarinamodopehaphilaton, adjustment)
      end
    )
  end

  test "Check ExKcal.Calc.multiplier()" do
    assert 1.0 == Calc.multiplier(1, 1)
    assert 2.0 == Calc.multiplier(100, 200)
    assert 3.3333333333333335 == Calc.multiplier(45, 150)
  end
end
