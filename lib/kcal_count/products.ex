defmodule KcalCount.Products do

  def init() do
    %{}
  end

  def add_one(product, products) do
    Map.update(products, Map.get(product, :name) |> String.to_atom(), product, &(&1))
  end

  def add_all(new_products, _products) do
    new_products
  end

  def get_one(name, products) do
    Map.get(products, name)
  end

  def get_all(products) do
    products
  end

end
