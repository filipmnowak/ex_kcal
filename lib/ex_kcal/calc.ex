defmodule ExKcal.Calc do
  @moduledoc """
  Provides functions to handle some of the operations related to weight manipulation on the `ExKcal.Product`s.
  """

  import ExKcal.Guards

  # TODO(fmn): I don't even know how it does anymore: review and improve.
  def adjust_by_weight(value, new_weight, current_weight \\ nil) do
    Enum.reduce(
      Enum.map(
        Map.keys(value)
        |> List.delete(:__struct__)
        |> Enum.filter(&(is_number(Map.get(value, &1)) or is_struct(Map.get(value, &1)))),
        fn k ->
          if k == :weight do
            [k, new_weight]
          else
            [k, update_value(Map.get(value, k), Map.get_lazy(value, :weight, fn -> current_weight end), new_weight)]
          end
        end
      ),
      value,
      &(update_value(&1, &2))
    )
  end

  def multiplier(divident, divisor) when is_non_neg_number(divident) and is_non_neg_number(divisor) do
    1/(divident/divisor)
  end

  def multiplier(_divident, _divisor) do
    {:err, :bad_args}
  end

  def update_value(value, weight, new_weight) when is_struct(value) do
    adjust_by_weight(value, new_weight, weight)
  end

  def update_value(value, {weight, _unit}, new_weight) when is_number(value) do
    value * multiplier(weight, new_weight)
  end

  def update_value([k, value], acc) do
    %{acc | k => value}
  end

end
