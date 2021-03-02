defmodule ExKcal do

  alias ExKcal.Products

  defdelegate new(), to: Products
  defdelegate add(product, products), to: Products
  defdelegate get(name, products), to: Products
  defdelegate find(regexp, products, fields), to: Products

end
