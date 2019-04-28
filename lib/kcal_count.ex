defmodule KcalCount do

  alias KcalCount.Products, as: Products

  defdelegate init(), to: Products, as: :init
  defdelegate add_one(product, products), to: Products, as: :add_one
  defdelegate add_all(new_products, products), to: Products, as: :add_all
  defdelegate get_one(name, products), to: Products, as: :get_one
  defdelegate get_all(products), to: Products, as: :get_all

end
