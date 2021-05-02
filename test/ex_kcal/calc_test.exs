defmodule ExKcal.CalcTest do
  use ExUnit.Case, async: true
  doctest ExKcal.Calc

  alias ExKcal.Product
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
      fats: %Fats{
        monounsaturated: {1, :g},
        polyunsaturated: {2, :g},
        saturated: {3, :g},
        total: {6, :g}
      },
      kcal: 1_023_552.0,
      minerals: %Minerals{
        chromium: {1.0, :mg},
      },
      name: "carxadopadolarinamodopehaphilaton",
      origin: [:planet_zordax13],
      vitamins: %Vitamins{
        choline: {42.2, :mg},
        vitamin_c: {48_213_457.0, :g},
      },
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
          fats: %ExKcal.Fats{
            monounsaturated: {1.6, :g},
            polyunsaturated: {3.2, :g},
            saturated: {4.800000000000001, :g},
            total: {9.600000000000001, :g}
          },
          kcal: 1_637_683.2000000002,
          minerals: %ExKcal.Minerals{
            chromium: {1.6, :mg},
          },
          name: "carxadopadolarinamodopehaphilaton",
          origin: [:planet_zordax13],
          vitamins: %ExKcal.Vitamins{
            choline: {67.52000000000001, :mg},
            vitamin_c: {77_141_531.2, :g},
          },
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
          fats: %ExKcal.Fats{
            monounsaturated: {0.272, :g},
            polyunsaturated: {0.544, :g},
            saturated: {0.8160000000000001, :g},
            total: {1.6320000000000001, :g}
          },
          kcal: 278_406.14400000003,
          minerals: %ExKcal.Minerals{
            chromium: {0.272, :mg},
          },
          name: "carxadopadolarinamodopehaphilaton",
          origin: [:planet_zordax13],
          vitamins: %ExKcal.Vitamins{
            choline: {11.478400000000002, :mg},
            vitamin_c: {13_114_060.304000001, :g},
          },
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

end
