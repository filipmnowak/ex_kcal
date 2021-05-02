# ExKcal

## Notes

This is exploratory, toy project, strange things in the code, too much emphasis on types etc.

## Installation

[Available in Hex](https://hex.pm/docs/publish); the package can be installed by adding `ex_kcal`
to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_kcal, "~> 0.0.6"}
  ]
end
```

## Examples

```elixir
alias ExKcal.Product
alias ExKcal.Products
alias ExKcal.Recipe
ExKcal.Recipe.Step, as: RecipeStep
ExKcal.Recipe.Time, as: RecipeTime

{:ok, products} = Products.new() |> Products.add(%Product{name: "lentils"})
...
step1 = %RecipeStep{time: %RecipeTime{minutes: 5, seconds: 10}, instructions: "wash in cold water", products: products}
...
step2 = %RecipeStep{time: %RecipeTime{hours: 1}, instructions: "cook on medium heat"}
...
recipe = Recipe.add_step(Recipe.new(), step1) |> Recipe.add_step(Recipe.new(), step2)
```

## Docs
Check [at Hex](https://hexdocs.pm/ex_kcal).
