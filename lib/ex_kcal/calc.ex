defmodule ExKcal.Calc do

  defguard is_non_negative_number(value) when is_number(value) and value >= 0

  def adjust_by_weigth(value, new_weigth, current_weigth \\ nil) do
    Enum.reduce(
      Enum.map(
        Map.keys(value)
        |> List.delete(:__struct__)
        |> Enum.filter(&(is_number(Map.get(value, &1)) or is_struct(Map.get(value, &1)))),
        fn k ->
          if k == :weigth do
            [k, new_weigth]
          else
            [k, update_value(Map.get(value, k), Map.get_lazy(value, :weigth, fn -> current_weigth end), new_weigth)]
          end
        end
      ),
      value,
      &(update_value(&1, &2))
    )
  end

  def multiplier(divident, divisor) when is_non_negative_number(divident) and is_non_negative_number(divisor) do
    1/(divident/divisor)
  end

  def multiplier(_divident, _divisor) do
    {:err, :bad_args}
  end

  def update_value(value, weigth, new_weigth) when is_struct(value) do
    adjust_by_weigth(value, new_weigth, weigth)
  end

  def update_value(value, weigth, new_weigth) when is_number(value) do
    value * multiplier(weigth, new_weigth)
  end

  def update_value([k, value], acc) do
    %{acc | k => value}
  end

end
