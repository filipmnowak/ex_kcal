defmodule ExKcal.Products do
  @moduledoc """
  Main purpose of the module is to represent set of products and primitives required to manipulate it.
  It's analog of `MapSet`, but `MapSet` leaves us in uneasy situation, as its implementation details are private (opaque type)
  so there is no clean way of using it in guards (without (ab)using knowledge of hidden implementation details), and there are
  very few primitives accompanying it. `ExKcal.Products` offers something similar, doesn't hide implementation details, and
  builds upon them.
  """

  alias ExKcal.Product
  alias ExKcal.Products

  @type t :: %__MODULE__{map: %{Product.t() => nil}}

  @enforce_keys [:map]
  defstruct(map: %{})

  @doc """
  Get new instance of `Products` struct. Equivalent of `%Products{map: %{}}`.
  """
  @spec new() :: t()
  def new() do
    %Products{map: %{}}
  end

  @doc """
  `Products` from list of `Product`s.
  """
  @spec from_list(list(Product.t())) :: t()
  def from_list(list) when is_list(list) do
    Enum.reduce(
      list,
      new(),
      fn product, products ->
        {:ok, products} = add(products, product)
        products
      end
    )
  end

  @doc """
  Add `Product` to `Products`.
  """
  @spec add(t(), Product.t()) :: {:ok, t()} | {:noop, :already_member}
  def add(products, product) when is_struct(products, Products) and is_struct(product, Product) do
    (Map.has_key?(products.map, product) && {:noop, :already_member}) ||
      {:ok, Map.put(products, :map, Map.put(products.map, product, nil))}
  end

  @doc """
  Get `Product` by content of the `name` field. Exact match is required.
  """
  @spec get(t(), String.t()) :: {:ok, Product.t()} | {:not_found, nil}
  def get(products, name) when is_struct(products, Products) and is_bitstring(name) do
    product =
      products.map
      |> Map.keys()
      |> Enum.find(fn p ->
        p.name == name
      end)

    case is_nil(product) do
      true -> {:not_found, nil}
      false -> {:ok, product}
    end
  end

  @doc """
  Find `Product`s by any field.
  ## Notes
  Match is done against space-separated, merged list of requested fields. This means that there is only one end of line, not
  multiple like in case of multiple, separate fields.
  """
  @spec find(Regex.t(), t(), list()) :: {:ok, list()} | {:not_found, nil}
  def find(regex, products, fields \\ [:name, :description])
      when is_struct(regex, Regex) and is_struct(products, Products) and is_list(fields) and
             length(fields) > 0 do
    found =
      products.map
      |> Map.keys()
      |> Enum.filter(fn p ->
        Regex.match?(
          regex,
          Enum.map(fields, fn f -> Map.get(p, f) end)
          |> Enum.join(" ")
        )
      end)

    case length(found) > 0 do
      true -> {:ok, found}
      false -> {:not_found, nil}
    end
  end
end
