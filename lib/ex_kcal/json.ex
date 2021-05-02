defmodule ExKcal.JSON do
  defimpl Poison.Encoder, for: Tuple do
    def encode({nil, :none} = _data, _options) do
      "nilnone"
      |> Poison.encode!()
    end

    def encode(data, _options) when is_tuple(data) do
      # fails, and that's fine for now
      Poison.encode!(data)
    end
  end

  defmacro __using__(_) do
    quote do
      def serialize(struct) when is_struct(struct, __MODULE__) do
        Poison.encode!(struct)
      end

      def deserialize(data) do
        s = struct(__MODULE__)
        Enum.reduce(
          Map.keys(s),
          Poison.decode!(data, as: s),
          fn k, acc ->
            Map.update(acc, k, nil, fn v ->
              case v do
                "nilnone" -> {nil, :none}
                _ -> v
              end
            end)
          end)
      end
    end
  end
end
