defmodule ExKcal.RecipeTest do
  use ExUnit.Case, async: true

  alias ExKcal.Recipe
  alias ExKcal.Recipe.Step, as: RecipeStep
  alias ExKcal.Recipe.Time, as: RecipeTime

  test "Check if ExKcal.Recipe.new returns proper structure" do
    assert %Recipe{steps: []} == Recipe.new()
  end

  test "Check if ExKcal.Recipe.add_step returns `Recipe` with additional `RecipeStep`" do
    test_recipe = %Recipe{
      steps: [
        %RecipeStep{
          instructions: "stirr the air!",
          time: %RecipeTime{},
          notes: "",
          products: %ExKcal.Products{map: %{}}
        }
      ]
    }
    step = RecipeStep.new("stirr the air!", %RecipeTime{})
    recipe = Recipe.new()
    recipe = Recipe.add_step(recipe, step)
    assert test_recipe == recipe
  end
  test "Check if ExKcal.Recipe.delete_step returns `Recipe` without removed `RecipeStep`" do
    test_recipe = %Recipe{
      steps: [
        %RecipeStep{
          instructions: "stirr the air!",
          time: %RecipeTime{},
          notes: "",
          products: %ExKcal.Products{map: %{}}
        },
        %RecipeStep{
          instructions: "dance like nobody's watching!",
          time: %RecipeTime{},
          notes: "",
          products: %ExKcal.Products{map: %{}}
        },
        %RecipeStep{
          instructions: "drink some water!",
          time: %RecipeTime{},
          notes: "",
          products: %ExKcal.Products{map: %{}}
        }
      ]
    }

    recipe = Recipe.new()
    recipe = Recipe.add_step(recipe, RecipeStep.new("stirr the air!", %RecipeTime{}))
    recipe = Recipe.add_step(recipe, RecipeStep.new("dance like nobody's watching!", %RecipeTime{}))
    recipe = Recipe.add_step(recipe, RecipeStep.new("drink some water!", %RecipeTime{}))
    assert test_recipe == recipe
    assert %Recipe{test_recipe | steps: List.delete_at(test_recipe.steps, 1)} == Recipe.delete_step(recipe, 1)
  end
end
