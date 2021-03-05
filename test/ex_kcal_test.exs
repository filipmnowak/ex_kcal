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
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
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
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
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
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
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
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
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
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    test_potato = %Product{
      kcal: 76.9,
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
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
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    test_potato = %Product{
      kcal: 76.9,
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
      },
      name: "Potato",
      brand: "X Potato",
      producer: "X Farmer"
    }

    test_something = %Product{
      kcal: 76.9,
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
      },
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
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    test_potato = %Product{
      kcal: 76.9,
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
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


  test "Check ExKcal.Calc.adjust_by_weigth() for correct adjustments" do
    # base values multiplied by 0.44999999999999996
    test_lentil = %Product{
      alcohols: %ExKcal.Alcohols{ethanol: 0.0, other: 0.0, total: 0.0},
      brand: "Some Brand",
      carbs: %ExKcal.Carbs{
        dietary_fiber: 4.8149999999999995,
        other: 28.349999999999998,
        starch: 0.0,
        sugars: 0.8999999999999999,
        total: 34.065
      },
      description: "",
      fats: %ExKcal.Fats{
        monounsaturated: 0.0,
        polyunsaturated: 0.0,
        saturated: 0.0,
        total: 0.44999999999999996
      },
      kcal: 158.85,
      minerals: %ExKcal.Minerals{
        calcium: 0.0,
        chloride: 0.0,
        chromium: 0.0,
        copper: 0.0,
        fluoride: 0.0,
        iodide: 0.0,
        iodine: 0.0,
        iron: 0.0,
        magnesium: 0.0,
        manganese: 0.0,
        molybdenum: 0.0,
        phosphorus: 0.0,
        potassium: 0.0,
        selenium: 0.0,
        sodium: 0.0,
        sulfur: 0.0,
        zinc: 0.0
      },
      name: "Lentil",
      note: "",
      origin: [],
      produced: [],
      producer: "Some producer",
      proteins: 11.249999999999998,
      salt: 0.0,
      vitamins: %ExKcal.Vitamins{
        choline: 0.0,
        vitamin_a: 0.0,
        vitamin_b1: 0.0,
        vitamin_b12: 0.0,
        vitamin_b2: 0.0,
        vitamin_b3: 0.0,
        vitamin_b4: 0.0,
        vitamin_b6: 0.0,
        vitamin_b9: 0.0,
        vitamin_c: 0.0,
        vitamin_d: 0.0,
        vitamin_e: 0.0,
        vitamin_k: 0.0
      },
      volume: 0.0,
      weigth: 45
      }

    # base values multiplied by 2
    test_potato = %ExKcal.Product{
      alcohols: %ExKcal.Alcohols{ethanol: 0.0, other: 0.0, total: 0.0},
      brand: "X Potato",
      carbs: %ExKcal.Carbs{
        dietary_fiber: 4.4,
        other: 0.0,
        starch: 0.0,
        sugars: 1.56,
        total: 34.0
      },
      description: "",
      fats: %ExKcal.Fats{
      monounsaturated: 0.0,
      polyunsaturated: 0.08,
      saturated: 0.06,
      total: 0.18
      },
      kcal: 153.8,
      minerals: %ExKcal.Minerals{
        calcium: 0.0,
        chloride: 0.0,
        chromium: 0.0,
        copper: 0.0,
        fluoride: 0.0,
        iodide: 0.0,
        iodine: 0.0,
        iron: 0.0,
        magnesium: 0.0,
        manganese: 0.0,
        molybdenum: 0.0,
        phosphorus: 0.0,
        potassium: 0.0,
        selenium: 0.0,
        sodium: 0.0,
        sulfur: 0.0,
        zinc: 0.0
      },
      name: "Potato",
      note: "",
      origin: [],
      produced: [],
      producer: "X Farmer",
      proteins: 4.0,
      salt: 0.0,
      vitamins: %ExKcal.Vitamins{
        choline: 0.0,
        vitamin_a: 0.0,
        vitamin_b1: 0.0,
        vitamin_b12: 0.0,
        vitamin_b2: 0.0,
        vitamin_b3: 0.0,
        vitamin_b4: 0.0,
        vitamin_b6: 0.0,
        vitamin_b9: 0.0,
        vitamin_c: 0.0,
        vitamin_d: 0.0,
        vitamin_e: 0.0,
        vitamin_k: 0.0
      },
      volume: 0.0,
      weigth: 200
    }

    lentil = %Product{
      kcal: 353,
      weigth: 100,
      proteins: 25,
      carbs: %Carbs{
        total: 75.7,
        other: 63,
        sugars: 2,
        dietary_fiber: 10.7
      },
      fats: %Fats{
        total: 1,
        saturated: 0,
        monounsaturated: 0,
        polyunsaturated: 0
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    potato = %Product{
      kcal: 76.9,
      weigth: 100,
      proteins: 2,
      carbs: %Carbs{
        total: 17,
        other: 0,
        sugars: 0.78,
        dietary_fiber: 2.2
      },
      fats: %Fats{
        total: 0.09,
        saturated: 0.03,
        monounsaturated: 0,
        polyunsaturated: 0.04
      },
      name: "Potato",
      brand: "X Potato",
      producer: "X Farmer"
    }

    test_products = %Products{map: %{test_lentil => nil, test_potato => nil}}
    products = Products.new()
    {:ok, products} = Products.add(products, Calc.adjust_by_weigth(lentil, 45))
    {:ok, products} = Products.add(products, Calc.adjust_by_weigth(potato, 200))
    assert test_products == products
    #assert true === Map.equal?(test_products, products)
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
