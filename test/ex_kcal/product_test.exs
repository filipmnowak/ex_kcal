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

    test_potato = %Product{
      kcal: 76.9,
      amount: {100.0, :g},
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

    test_lentilopotat = %Product{
      carbs: %Carbs{
        dietary_fiber: {12.899999999999999, :g},
        other: {63.0, :g},
        starch: {nil, :none},
        sugars: {2.7800000000000002, :g},
        total: {92.7, :g}
      },
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

  test "Product.encode/1" do
    assert(Product.encode(%Product{}) |> Product.decode() == %Product{})
  end

  test "Product.decode/1" do
    input = """
    {
      "alcohols": {
      "ethanol": [null, "none"],
      "other": [null, "none"],
      "total": [null, "none"]
    },
      "amount": [null, "none"],
      "brand": "",
      "carbs": {
      "dietary_fiber": [null, "none"],
      "other": [null, "none"],
      "starch": [null, "none"],
      "sugars": [null, "none"],
      "total": [null, "none"]
    },
    "description": "",
    "fats": {
      "monounsaturated": [null, "none"],
      "polyunsaturated": [null, "none"],
      "saturated": [null, "none"],
      "total": [null, "none"]
    },
    "kcal": 0.0,
    "minerals": {
      "calcium": [null, "none"],
      "chloride": [null, "none"],
      "chromium": [null, "none"],
      "copper": [null, "none"],
      "fluoride": [null, "none"],
      "iodide": [null, "none"],
      "iodine": [null, "none"],
      "iron": [null, "none"],
      "magnesium": [null, "none"],
      "manganese": [null, "none"],
      "molybdenum": [null, "none"],
      "phosphorus": [null, "none"],
      "potassium": [null, "none"],
      "selenium": [null, "none"],
      "sodium": [null, "none"],
      "sulfur": [null, "none"],
      "zinc": [null, "none"]
    },
    "name": "",
    "note": "",
    "origin": [],
    "produced": [],
    "producer": "",
    "proteins": [null, "none"],
    "salt": [null, "none"],
    "vitamins": {
      "choline": [null, "none"],
      "vitamin_a": [null, "none"],
      "vitamin_b1": [null, "none"],
      "vitamin_b12": [null, "none"],
      "vitamin_b2": [null, "none"],
      "vitamin_b3": [null, "none"],
      "vitamin_b4": [null, "none"],
      "vitamin_b6": [null, "none"],
      "vitamin_b9": [null, "none"],
      "vitamin_c": [null, "none"],
      "vitamin_d": [null, "none"],
      "vitamin_e": [null, "none"],
      "vitamin_k": [null, "none"]
      }
    }
    """

    assert(Product.decode(input) === %Product{})
  end
end
