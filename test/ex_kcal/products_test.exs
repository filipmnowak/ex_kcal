defmodule ExKcal.ProductsTest do
  use ExUnit.Case, async: true
  doctest ExKcal.Products

  alias ExKcal.Products
  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats

  test "Check ExKcal.Products.new()" do
    assert %Products{map: %{}} === Products.new()
  end

  test "Check ExKcal.Products.from_list() from empty list" do
    assert %Products{map: %{}} === Products.from_list([])
  end

  test "Check ExKcal.Products.from_list()" do
    product_list = [
      %Product{name: "something"},
      %Product{description: "something else"}
    ]
    products = %Products{
      map: %{
        %Product{name: "something"} => nil,
        %Product{description: "something else"} => nil,
      }
    }
    assert products === Products.from_list(product_list)
  end

  test "Check ExKcal.Products.add() if product added" do
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

    test_products = %Products{map: %{test_lentil => nil}}
    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    assert test_products == products
  end

  test "Check ExKcal.Products.add() if product not added because it's already there" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    assert {:noop, :already_member} == Products.add(products, test_lentil)
  end

  test "Check Product.get() if product returned" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_potato)
    assert {:ok, test_potato} == Products.get(products, "Potato")
  end

  test "Check Product.get() if missing product not returned" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_potato)
    assert {:not_found, nil} == Products.get(products, "Orange")
  end

  test "Check ExKcal.Products.get() if missing product not returned" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_potato)
    assert {:not_found, nil} == Products.get(products, "Orange")
  end

  test "Check ExKcal.Products.find() if returns single match by name only" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    {:ok, products} = Products.add(products, test_potato)
    assert {:ok, [test_lentil]} == Products.find(~r/entil/, products, [:name])
  end

  test "Check ExKcal.Products.find() if returns right two matches by two fields" do
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

  test "Check ExKcal.Products.find() if returns right result for lack of matches" do
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

    products = Products.new()
    {:ok, products} = Products.add(products, test_lentil)
    {:ok, products} = Products.add(products, test_potato)
    assert {:not_found, nil} == Products.find(~r/i don't think it's there/, products)
  end
end
