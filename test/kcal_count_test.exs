defmodule KcalCountTest do

  use ExUnit.Case
  doctest KcalCount

  alias KcalCount.Product, as: Product
  alias KcalCount.Carbs, as: Carbs
  alias KcalCount.Fats, as: Fats

  test "Check KcalCount.init()" do
    assert %{} == KcalCount.init()
  end

  test "Check KcalCount.add_one() if product added" do
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    test_products = %{Lentil: test_lentil}
    products = KcalCount.init()
    products = KcalCount.add_one(products, test_lentil)
    assert test_products == products
  end

  test "Check KcalCount.add_all() if products added / replaced" do
    test_lentil = %Product{
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
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
        other: nil,
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

    test_products = %{Lentil: test_lentil, Potato: test_potato}
    products = KcalCount.init()
    products = KcalCount.add_all(products, test_products)
    assert test_products == products
  end

  test "Check KcalCount.get_one() if product returned" do
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
      },
      name: "Lentil",
      brand: "Some Brand",
      producer: "Some producer"
    }

    products = KcalCount.init()
    products = KcalCount.add_one(products, test_lentil)
    lentil = KcalCount.get_one(products, :Lentil)
    assert test_lentil == lentil
  end

  test "Check KcalCount.get_one() if other product returned" do
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
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
        other: nil,
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

    products = KcalCount.init()
    products = KcalCount.add_one(products, test_lentil)
    products = KcalCount.add_one(products, test_potato)
    potato = KcalCount.get_one(products, :Potato)
    assert test_potato == potato
  end

  test "Check KcalCount.get_one() on no such product" do
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
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
        other: nil,
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

    products = KcalCount.init()
    products = KcalCount.add_one(products, test_lentil)
    products = KcalCount.add_one(products, test_potato)
    pear = KcalCount.get_one(products, :Pear)
    assert nil == pear
  end

  test "Check KcalCount.get_all() if products returned" do
    test_lentil = %Product{
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
        saturated: nil,
        monounsaturated: nil,
        polyunsaturated: nil
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
        other: nil,
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

    test_products = %{Lentil: test_lentil, Potato: test_potato}
    products = KcalCount.init()
    products = KcalCount.add_one(products, test_potato)
    products = KcalCount.add_one(products, test_lentil)
    products = KcalCount.get_all(products)
    assert test_products == products
  end

  test "Check KcalCount.get_all() on empty products" do
    products = KcalCount.init()
    products = KcalCount.get_all(products)
    assert %{} == products
  end

end
