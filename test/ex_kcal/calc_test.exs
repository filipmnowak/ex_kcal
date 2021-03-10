defmodule ExKcal.CalcTest do

  use ExUnit.Case, async: true
  doctest ExKcal.Calc

  alias ExKcal.Products
  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Calc

  test "Check ExKcal.Calc.adjust_by_weight() for correct adjustments" do
    # base values multiplied by 0.44999999999999996
    test_lentil = %Product{
      weight: {100.0, :g},
      proteins: {25.0, :g},
      carbs: %Carbs{
        total: {75.7, :g},
        other: {63.0, :g},
        sugars: {2.0, :g},
        dietary_fiber: {10.7, :g}
      },
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
    # base values multiplied by 2
    test_potato =  %Product{
      brand: "X Potato",
      carbs: %Carbs{
        dietary_fiber: {2.2, :g},
        other: {0.0, :g},
        sugars: {0.78, :g},
        total: {17.0, :g}
      },
      description: "",
      fats: %Fats{
        monounsaturated: {0.0, :g},
        polyunsaturated: {0.04, :g},
        saturated: {0.03, :g},
        total: {0.09, :g}
      },
      kcal: 153.8,
      name: "Potato",
      producer: "X Farmer",
      proteins: {2.0, :g},
      weight: {100.0, :g}
  }

    lentil = %Product{
      weight: {100.0, :g},
      proteins: {25.0, :g},
      carbs: %Carbs{
        total: {75.7, :g},
        other: {63.0, :g},
        sugars: {2.0, :g},
        dietary_fiber: {10.7, :g}
      },
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
    potato = %Product{
      kcal: 76.9,
      weight: {100.0, :g},
      proteins: {2.0, :g},
      carbs: %Carbs{
        total: {17.0, :g},
        other: {0.0, :g},
        sugars: {0.78, :g},
        dietary_fiber: {2.2, :g}
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

    test_products = %Products{map: %{test_lentil => nil, test_potato => nil}}
    products = Products.new()
    {:ok, products} = Products.add(products, Calc.adjust_by_weight(lentil, 45))
    {:ok, products} = Products.add(products, Calc.adjust_by_weight(potato, 200))
    assert test_products == products
    assert true === Map.equal?(test_products, products)
  end

  test "Check ExKcal.Calc.multiplier()" do
    assert 1.0 == Calc.multiplier(1, 1)
    assert 2.0 == Calc.multiplier(100, 200)
    assert 3.3333333333333335 == Calc.multiplier(45, 150)
    assert {:err, :bad_args} == Calc.multiplier(-45, -5)
    assert {:err, :bad_args} == Calc.multiplier(-45, "a")
    assert {:err, :bad_args} == Calc.multiplier(:a, -150)
    assert {:err, :bad_args} == Calc.multiplier(-45, 0)
  end
end
