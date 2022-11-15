defmodule ExKcal.Calc do
  @moduledoc """
  Provides functions to handle some of the operations related to weight manipulation on the `ExKcal.Product`s.
  """

  use ExKcal.Units
  import ExKcal.Guards
  alias ExKcal.SI
  alias ExKcal.Calc

  @doc """
  Super quirky function adjusting amount of product. I bet there are mistakes, corner cases not being covered
  and calculation issues!
  """
  @spec adjust_amount(struct(), weight() | volume(), weight() | volume() | nil) :: struct()
  def adjust_amount(value, {new_count, new_unit}, current_amount \\ nil) when is_struct(value) do
    {current_count, current_unit} = Map.get_lazy(value, :amount, fn -> current_amount end)

    {normalized_new_count, normalized_new_unit} =
      Calc.convert_si_unit({new_count, new_unit}, current_unit)

    Enum.reduce(
      Enum.map(
        Map.keys(value)
        |> List.delete(:__struct__),
        fn k ->
          case k do
            :amount ->
              {k, {new_count, new_unit}}

            _ ->
              {
                k,
                adjust_value(
                  Map.get(value, k),
                  {normalized_new_count, normalized_new_unit},
                  {current_count, current_unit}
                )
              }
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

  defp adjust_value(value, new_weight, weight) when is_struct(value) do
    adjust_amount(value, new_weight, weight)
  end

  defp adjust_value({nil, :none}, _, _) do
    {nil, :none}
  end

  defp adjust_value({value, unit}, {new_count, _}, {count, _}) do
    {value * multiplier(count, new_count), unit}
  end

  defp adjust_value(value, {new_count, _}, {count, _}) when is_number(value) do
    value * multiplier(count, new_count)
  end

  defp adjust_value(value, _, _) when is_bitstring(value) or is_list(value) do
    value
  end

  defp update_value({k, value}, acc) do
    %{acc | k => value}
  end

  @doc """
  Converts ExKcal.Units.weight() and ExKcal.Units.volume() type values to target unit.
  ## Notes
  There is some quirkiness to that function:
  - it converts from prefix to prefix, not really from unit to unit. This means that only prefix is taken into account
    during the conversion. Because of that, conversion between volume and weight units will go through (see examples).

  ## Examples

      iex> import ExKcal.Calc
      iex> convert_si_unit({0.1, :mg}, :dl)
      {0.001, :dl}
      iex> convert_si_unit({1002.0, :g}, :kg)
      {1.002, :kg}
      iex> convert_si_unit({0.23, :dag}, :mg)
      {2.3e3, :mg}

  """
  @spec convert_si_unit(weight() | volume(), atom()) :: weight() | volume()
  def convert_si_unit({value, unit_from}, unit_to) when unit_from === unit_to do
    # noop
    {value, unit_from}
  end

  def convert_si_unit({value, unit_from}, unit_to) do
    prefix_from = SI.extract_prefix(unit_from)
    prefix_to = SI.extract_prefix(unit_to)
    factor = SI.prefix_conversion_factor(prefix_from, prefix_to)
    {(value + 0.0) * 10 ** factor, unit_to}
  end
end
