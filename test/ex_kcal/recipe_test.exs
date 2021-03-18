defmodule ExKcal.RecipeTest do
  use ExUnit.Case, async: true

  alias ExKcal.Recipe
  alias ExKcal.Recipe.Step, as: RecipeStep
  alias ExKcal.Recipe.Time, as: RecipeTime
  alias ExKcal.Product
  alias ExKcal.Fats
  alias ExKcal.Carbs

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

    recipe =
      Recipe.add_step(recipe, RecipeStep.new("dance like nobody's watching!", %RecipeTime{}))

    recipe = Recipe.add_step(recipe, RecipeStep.new("drink some water!", %RecipeTime{}))
    assert test_recipe == recipe

    assert %Recipe{test_recipe | steps: List.delete_at(test_recipe.steps, 1)} ==
             Recipe.delete_step(recipe, 1)
  end

  test "Check if ExKcal.Recipe.total_nutrition returns correct result" do
    steps = {
      %RecipeStep{
        instructions: "stirr the air!",
        time: %RecipeTime{},
        notes: "",
        products: %ExKcal.Products{map: %{%Product{name: "blue apple", kcal: 25.0, fats: %Fats{total: {100.0, :g}}} => nil}}
      },
      %RecipeStep{
        instructions: "dance like nobody's watching!",
        time: %RecipeTime{},
        notes: "",
        products: %ExKcal.Products{map: %{%Product{name: "no name", kcal: 25.0, carbs: %Carbs{starch: {100.0, :g}}} => nil}}
      },
      %RecipeStep{
        instructions: "drink some water!",
        time: %RecipeTime{},
        notes: "",
        products: %ExKcal.Products{map: %{%Product{kcal: 50.1, carbs: %Carbs{starch: {25.25, :g}}} => nil}}
      }
    }

    test_sum_product = %ExKcal.Product{
      carbs: %ExKcal.Carbs{
        starch: {125.25, :g},
      },
      fats: %ExKcal.Fats{
        total: {100.0, :g}
      },
      kcal: 100.1
    }

    recipe = Recipe.new()
    recipe = Recipe.add_step(recipe, elem(steps, 0))
    recipe = Recipe.add_step(recipe, elem(steps, 1))
    recipe = Recipe.add_step(recipe, elem(steps, 2))
    assert test_sum_product  == Recipe.total_nutrition(recipe)

  end
end
