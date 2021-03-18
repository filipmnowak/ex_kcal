defmodule ExKcal do
  alias ExKcal.Products
  alias ExKcal.Recipe

  defdelegate new_products(), to: Products, as: :new
  defdelegate add_product(product, products), to: Products, as: :add
  defdelegate get_product(name, products), to: Products, as: :get
  defdelegate new_recipe(), to: Recipe, as: :new
  defdelegate add_step(recipe, recipe_step), to: Recipe
  defdelegate delete_step(recipe, recipe_step_index), to: Recipe
end
