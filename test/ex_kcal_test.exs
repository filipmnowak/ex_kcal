defmodule ExKcalTest do

  use ExUnit.Case
  doctest ExKcal

  alias ExKcal.Products
  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Calc

  test "Check Products.new()" do
    assert %Products{map: %{}} == Products.new()
  end

  test "Check Products.add() if product added" do
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

    test_products = %Products{map: %{test_lentil => nil}}
    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    assert test_products == products
  end

  test "Check Products.add() if product not added because it's already there" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    assert {:noop, :already_member} == Products.add(products, test_lentil)
  end

  test "Check Product.get() if product returned" do
    test_potato = %Product{
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_potato)
    assert {:ok, test_potato} == Products.get(products, "Potato")
  end

  test "Check Product.get() if missing product not returned" do
    test_potato = %Product{
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_potato)
    assert {:not_found, nil} == Products.get(products, "Orange")
  end

  test "Check Product.find() if returns single match by name only" do
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
    test_potato = %Product{
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    {:ok, products} = Products.add(products, test_potato)
    assert {:ok, [test_lentil]} == Products.find(~r/entil/, products, [:name])
  end

  test "Check Product.find() if returns right two matches by two fields" do
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
    test_potato = %Product{
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
    test_something = %Product{
      name: "something",
      brand: "something",
      producer: "something"
    }

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    {:ok, products} = Products.add(products, test_potato)
    {:ok, products} = Products.add(products, test_something)
    {:ok, result} = Products.find(~r/(nd|er)/, products, [:producer, :brand])
    assert test_lentil in result and test_potato in result
    assert test_something not in result
  end

  test "Check Product.find() if returns right result for lack of matches" do
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
    test_potato = %Product{
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    {:ok, products} = Products.add(products, test_potato)
    assert {:not_found, nil} == Products.find(~r/i don't think it's there/, products)
  end


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
