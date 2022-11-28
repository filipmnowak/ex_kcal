defmodule ExKcal.Product do
  use ExKcal.Units

  alias ExKcal.Product
  alias ExKcal.Carbs
  alias ExKcal.Fats
  alias ExKcal.Vitamins
  alias ExKcal.Minerals
  alias ExKcal.Alcohols
  alias ExKcal.Helpers, as: H

  defimpl Jason.Encoder, for: [Tuple] do
    def encode(tuple, opts) do
      Jason.Encode.list(Tuple.to_list(tuple), opts)
    end
  end

  @typedoc """
  Struct representing single product. Base unit for `ExKcal.Products`.
  """
  @type t :: %__MODULE__{
          kcal: float(),
          amount: weight() | volume(),
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
  @derive Jason.Encoder
  defstruct(
    kcal: 0.0,
    amount: {nil, :none},
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

          [{amount1, unit1}, {_amount2, _unit2}] = [v1, v2] ->
            {amount1 + (ExKcal.Calc.convert_si_unit(v2, unit1) |> elem(0)), unit1}
        end
      end
    )
  end

  def encode(struct) when is_struct(struct, Product) do
    Jason.encode!(struct)
  end

  def decode(string) do
    map =
      %{
        salt: [salt_amount, salt_unit],
        proteins: [proteins_amount, proteins_unit],
        amount: [amount, unit]
      } = Jason.decode!(string, keys: :atoms!)

    struct!(
      Product,
      %{
        map
        | salt: {H.decode(salt_amount), H.decode(salt_unit)},
          proteins: {H.decode(proteins_amount), H.decode(proteins_unit)},
          amount: {H.decode(amount), H.decode(unit)},
          carbs: Carbs.decode(map.carbs),
          fats: Fats.decode(map.fats),
          vitamins: Vitamins.decode(map.vitamins),
          minerals: Minerals.decode(map.minerals),
          alcohols: Alcohols.decode(map.alcohols)
      }
    )
  end
end
