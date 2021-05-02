# ExKcal

## Notes

This is exploratory, toy project, strange things in the code, too much emphasis on types etc.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_kcal` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_kcal, "~> 0.0.6"}
  ]
end
```

## Examples

```elixir
{:ok, products} = ExKcal.Products.new() |> ExKcal.Products.add(%ExKcal.Product{name: "lentils"})
...
step1 = %ExKcal.Recipe.Step{time: %ExKcal.Recipe.Time{minutes: 5, seconds: 10}, instructions: "wash in cold water", products: products}
...
step2 = %ExKcal.Recipe.Step{time: %ExKcal.Recipe.Time{hours: 1}, instructions: "cook on medium heat"}
...
recipe = ExKcal.Recipe.add_step(ExKcal.Recipe.new(), step1) |> ExKcal.Recipe.add_step(ExKcal.Recipe.new(), step2)
```

## Docs
[https://hexdocs.pm/ex_kcal](https://hexdocs.pm/ex_kcal).
