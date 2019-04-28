defmodule KcalCount.Products do

  def init() do
    %{}
  end

  def add_one(products, product) do
    Map.update(products, Map.get(product, :name) |> String.to_atom(), product, &(&1))
  end

  def add_all(_products, new_products) do
    new_products
  end

  def get_one(products, name) do
    Map.get(products, name)
  end

  def get_all(products) do
    products
  end

end
