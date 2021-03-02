defmodule ExKcal.Recipe do

  alias ExKcal.Recipe
  alias ExKcal.Recipe.Step

  defstruct(
    steps: []
  )

  defguard is_non_negative_number(value) when is_number(value) and value >= 0

  def add_step(recipe, step) when is_struct(recipe, Recipe) and is_struct(step, Step) do
    {:ok, %{recipe | steps: recipe.steps ++ [step]}}
  end

  def add_step(_, _) do
    {:err, :bad_args}
  end

  def delete_step(recipe, step_index)
    when is_struct(recipe, Recipe) and length(recipe.steps) > step_index and is_non_negative_number(step_index) do
    {:ok, %{recipe | steps: List.delete_at(recipe.steps, step_index)}}
  end

  def delete_step(_, _) do
    {:err, :bad_args}
  end

  def init() do
    %Recipe{}
  end

end
