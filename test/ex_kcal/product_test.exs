defmodule ExKcal.ProductTest do
  use ExUnit.Case, async: true
  doctest ExKcal.Product

  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats

  test "Check if Product.sum returns right result" do
    test_lentil = %Product{
      amount: {100.0, :g},
      proteins: {25.0, :g},
      carbs: %Carbs{
        total: {75.7, :g},
        other: {63.0, :g},
        sugars: {2.0, :g},
      },
        dietary_fiber: {10.7, :g},
      fats: %Fats{
        total: {1.0, :g},
        saturated: {0.0, :g},
        monounsaturated: {0.0, :g},
        polyunsaturated: {0.0, :g}
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    test_potato = %Product{
      kcal: 76.9,
      amount: {100.0, :g},
      proteins: {2.0, :g},
      carbs: %Carbs{
        total: {17.0, :g},
        other: {0.0, :g},
        sugars: {0.78, :g},
        dietary_fiber: {2.2, :g},
      },
      fats: %Fats{
        total: {0.09, :g},
        saturated: {0.03, :g},
        monounsaturated: {0.0, :g},
        polyunsaturated: {0.04, :g}
      },
      name: "Potato",
      brand: "X Potato",
      producer: "X Farmer"
    }

    test_lentilopotat = %Product{
      carbs: %Carbs{
        other: {63.0, :g},
        starch: {nil, :none},
        sugars: {2.7800000000000002, :g},
        total: {92.7, :g}
      },
        dietary_fiber: {12.899999999999999, :g},
      fats: %Fats{
        monounsaturated: {0.0, :g},
        polyunsaturated: {0.04, :g},
        saturated: {0.03, :g},
        total: {1.09, :g}
      },
      kcal: 76.9,
      proteins: {27.0, :g},
      amount: {200.0, :g}
    }

    assert test_lentilopotat == Product.sum(test_lentil, test_potato)
  end

end
