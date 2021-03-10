defmodule ExKcal do

  alias ExKcal.Products

  defdelegate new_products(), to: Products, as: :new
  defdelegate add_product(product, products), to: Products, as: :add
  defdelegate get_product(name, products), to: Products, as: :get
  defdelegate find_product(regexp, products, fields), to: Products, as: :find

end
