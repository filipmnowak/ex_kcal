defmodule ExKcal.Product do
  use ExKcal.Units

  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Alcohols

  @typedoc """
  Struct representing single product. Base unit for `ExKcal.Products`.
  """
  @type t :: %__MODULE__{
          kcal: float(),
          weight: weight(),
          volume: volume(),
          proteins: weight(),
          carbs: Carbs.t(),
          fats: Fats.t(),
          vitamins: Vitamins.t(),
          minerals: Minerals.t(),
          alcohols: Alcohols.t(),
          salt: weight(),
          name: String.t(),
          description: String.t(),
          note: String.t(),
          brand: String.t(),
          producer: String.t(),
          produced: list(String.t()),
          origin: list(String.t())
        }
  defstruct(
    kcal: 0.0,
    weight: {nil, :none},
    volume: {nil, :none},
    proteins: {nil, :none},
    carbs: %Carbs{},
    fats: %Fats{},
    vitamins: %Vitamins{},
    minerals: %Minerals{},
    alcohols: %Alcohols{},
    salt: {nil, :none},
    name: "",
    description: "",
    note: "",
    brand: "",
    producer: "",
    produced: [],
    origin: []
  )

  @doc """
  Calculate nutrition of two `ExKcal.Product`s.
  ## Note
  non-numeric values are set to struct's default.
  """
  @spec sum(t(), t()) :: t()
  def sum(item1, item2) do
    Map.merge(
      item1,
      item2,
      fn k, v1, v2 ->
        cond do
          k == :__struct__ ->
            v1
          is_struct(v1) ->
            sum(v1, v2)
          is_bitstring(v1) ->
            ""
          is_list(v1) ->
            []
          is_float(v1) ->
            v1 + v2
          {nil, :none} == v2 and {nil, :none} != v1 ->
            v1
          {nil, :none} == v1 and {nil, :none} != v2 ->
            v2
          {nil, :none} == v1 and {nil, :none} == v2 ->
            {nil, :none}
          [{weight1, unit1}, {_weight2, _unit2}] = [v1, v2] ->
            {weight1 + (ExKcal.Calc.convert_si_prefix(v2, unit1) |> elem(0)), unit1}
        end
      end
    )
  end
end
