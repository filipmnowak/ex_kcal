defmodule KcalCount do

  alias KcalCount.Products, as: Products

  defdelegate init(), to: Products, as: :init
  defdelegate add_one(products, product), to: Products, as: :add_one
  defdelegate add_all(products, new_products), to: Products, as: :add_all
  defdelegate get_one(products, name), to: Products, as: :get_one
  defdelegate get_all(products), to: Products, as: :get_all

end
