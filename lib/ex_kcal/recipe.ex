defmodule ExKcal.Recipe do
  @moduledoc """
  `ExKcal.Recipe` splits preparation task into the `list` of steps.
  """

  use ExKcal.Units
  import ExKcal.Guards

  alias ExKcal.Recipe
  alias ExKcal.Recipe.Step, as: RecipeStep
  alias ExKcal.Product

  @enforce_keys [:steps]
  defstruct(steps: [])

  @typedoc """
  Type representing recipe.
  """
  @type t :: %__MODULE__{steps: list(RecipeStep.t())}

  @doc """
  Construct new instance of `ExKcal.Recipe` struct.
  """
  @spec new() :: t()
  def new() do
    %Recipe{steps: []}
  end

  @doc """
  Add `ExKcal.Recipe.Step` to `ExKcal.Recipe`.
  """
  @spec add_step(t(), RecipeStep.t()) :: t()
  def add_step(recipe, step) when is_struct(recipe, Recipe) and is_struct(step, RecipeStep) do
    %Recipe{recipe | steps: recipe.steps ++ [step]}
  end

  @doc """
  Delete instance of `ExKcal.Recipe.Step` from `ExKcal.Recipe` by its index.
  """
  @spec delete_step(t(), non_neg_integer()) :: t()
  def delete_step(recipe, step_index)
      when is_struct(recipe, Recipe) and is_non_neg_number(step_index) and
             length(recipe.steps) > step_index do
    %Recipe{recipe | steps: List.delete_at(recipe.steps, step_index)}
  end

  @doc """
  Calculate total nutritional value of the `ExKcal.Products` used in the `ExKcal.Recipe`.
  It returns kind of a special `ExKcal.Product` instance containing sum of all of the relevant fields, from all of the used
  Products.
  ## Notes
  - Function doesn't take units into account.
  - It won't recalculate `total` fields, it will sum their values.
  """
  @spec total_nutrition(t()) :: Product.t()
  def total_nutrition(recipe) do
    Enum.reduce(
      recipe.steps
      |> Enum.map(
        fn step ->
          step.products.map
          |> Map.keys()
        end
      )
      |> List.flatten(),
      %Product{},
      fn p, acc ->
        Product.sum(acc, p)
      end
    )
  end
end
