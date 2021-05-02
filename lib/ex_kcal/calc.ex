defmodule ExKcal.Calc do
  @moduledoc """
  Provides functions to handle some of the operations related to weight manipulation on the `ExKcal.Product`s.
  """

  use ExKcal.Units
  import ExKcal.Guards
  alias ExKcal.SI

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

  defp multiplier(divident, divisor)
      when is_non_neg_number(divident) and is_non_neg_number(divisor) do
    1 / (divident / divisor)
  end

  defp adjust_value(value, weight, new_weight) when is_struct(value) do
    adjust_by_weight(value, new_weight, weight)
  end

  defp adjust_value({nil, :none}, _, _) do
    {nil, :none}
  end

  defp adjust_value({value, unit}, {weight, _}, new_weight) do
    {value * multiplier(weight, new_weight), unit}
  end

  defp adjust_value(value, {weight, _}, new_weight) when is_number(value) do
    value * multiplier(weight, new_weight)
  end

  defp adjust_value(value, _, _) when is_bitstring(value) or is_list(value) do
    value
  end

  defp update_value({k, value}, acc) do
    %{acc | k => value}
  end

  @doc """
  Converts ExKcal.Units.weight() and ExKcal.Units.volume() type values to target prefix.
  ## Notes
  Quirkiness of that function is already suggested by its name:
  - it converts from prefix to prefix, not really from unit to unit. This means that only prefix is taken into account
    during the conversion. Because of that, conversion between volume and weight units will go through (see examples).

  ## Examples

      iex> import ExKcal.Calc
      iex> convert_si_prefix({0.1, :mg}, :dl)
      {0.001, :dl}
      iex> convert_si_prefix({1002.0, :g}, :kg)
      {1.002, :kg}
      iex> convert_si_prefix({0.23, :dag}, :mg)
      {2.3e3, :mg}

  """
  @spec convert_si_prefix(weight() | volume(), atom()) :: weight() | volume()
  def convert_si_prefix({value, unit_from}, unit_to) when unit_from === unit_to do
    # noop
    {value, unit_from}
  end
  def convert_si_prefix({value, unit_from}, unit_to) do
    prefix_from = SI.extract_prefix(unit_from)
    prefix_to = SI.extract_prefix(unit_to)
    factor = SI.prefix_conversion_factor(prefix_from, prefix_to)
    normalized_value = to_string(value)
                       |> Float.parse()
                       |> elem(0)
    # TODO(fmn): there should be better way to do it.
    {Code.eval_string("#{normalized_value}e#{factor}")
    |> elem(0), unit_to}
  end
end
