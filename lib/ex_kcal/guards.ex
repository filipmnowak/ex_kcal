defmodule ExKcal.Guards do
  defguard is_non_neg_number(value) when is_number(value) and value >= 0
  defguard is_non_neg_float(value) when is_float(value) and value >= 0

  #  @doc since: "1.11.0", guard: true
  #  defmacro any_of_structs(term, names) do
  #    case __CALLER__.context do
  #      nil ->
  #        quote generated: true do
  #          case unquote(name) do
  #            name when is_atom(name) ->
  #                  case unquote(term) do
  #                    Enum.each(
  #                      names,
  #                      fn name ->
  #                        %{__struct__: ^name} -> true
  #                      end
  #                    )
  #                    _ -> false
  #                  end
  #            _ ->
  #              raise ArgumentError
  #          end
  #        end
  #
  #      :match ->
  #        invalid_match!(:is_struct)
  #
  #      :guard ->
  #        quote do
  #          is_map(unquote(term)) and
  #          Enum.each(
  #            names,
  #            fn name ->
  #              (is_atom(unquote(name)) or :fail) and
  #              :erlang.is_map_key(:__struct__, unquote(term)) and
  #              :erlang.map_get(:__struct__, unquote(term)) == unquote(name)
  #            end
  #          )
  #        end
  #    end
  #  end
end
