defmodule KcalCount.Products do

  alias KcalCount.Product
  alias KcalCount.Products

  @enforce_keys [:map]
  defstruct(map: %{})

  def new() do
    %Products{map: %{}}
  end

  def add(products, product) when is_struct(products, Products) and is_struct(product, Product) do
    Map.has_key?(products.map, product) && {:noop, :already_member} || {:ok, Map.put(products, :map, Map.put(products.map, product, nil))}
  end

  def get(products, name) when is_struct(products, Products) and is_bitstring(name) do
    product = products.map
    |> Map.to_list()
    |> Enum.find(
      fn {p, _} ->
        p.name == name
      end
    )
    case is_nil(product) do
      true -> {:not_found, product}
      false -> {:ok, elem(product, 0)}
    end
  end

  def find(regex, products, fields \\ [:name, :description])
    when is_struct(regex, Regex) and is_struct(products) and is_list(fields) and length(fields) > 0 do
      found = products.map
      |> Map.to_list()
      |> Enum.filter(
        fn {p, _} ->
          Regex.match?(
            regex,
            Enum.map(fields, fn f -> Map.get(p, f) end)
            |> Enum.join(" ")
          )
        end
      )
      |> Enum.map(fn {p, _} -> p end)
      case is_list(found) and length(found) > 0 do
        true -> {:ok, found}
        false -> {:not_found, found}
      end
  end

end
