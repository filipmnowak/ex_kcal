defmodule ExKcal.Calc do
  @moduledoc """
  Provides functions to handle some of the operations related to weight manipulation on the `ExKcal.Product`s.
  """

  import ExKcal.Guards

  def adjust_by_weight(value, new_weight, current_weight \\ nil) do
    Enum.reduce(
      Enum.map(
        Map.keys(value)
        |> List.delete(:__struct__),
        fn k ->
          if k == :weight do
            {k, {new_weight, :g}}
          else
            {k,
             adjust_value(
               Map.get(value, k),
               Map.get_lazy(value, :weight, fn -> current_weight end),
               new_weight
             )}
          end
        end
      ),
      value,
      &update_value(&1, &2)
    )
  end

  def multiplier(divident, divisor)
      when is_non_neg_number(divident) and is_non_neg_number(divisor) do
    1 / (divident / divisor)
  end

  def adjust_value(value, weight, new_weight) when is_struct(value) do
    adjust_by_weight(value, new_weight, weight)
  end

  def adjust_value({nil, :none}, _, _) do
    {nil, :none}
  end

  def adjust_value({value, unit}, {weight, _}, new_weight) do
    {value * multiplier(weight, new_weight), unit}
  end

  def adjust_value(value, {weight, _}, new_weight) when is_number(value) do
    value * multiplier(weight, new_weight)
  end

  def adjust_value(value, _, _) when is_bitstring(value) or is_list(value) do
    value
  end

  def update_value({k, value}, acc) do
    %{acc | k => value}
  end
end
