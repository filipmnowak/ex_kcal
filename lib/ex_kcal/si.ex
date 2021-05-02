defmodule ExKcal.SI do
  @moduledoc """
  Various SI prefixes-related functions etc.
  """

  use ExKcal.Units

  @doc """
  Returns list of tuples representing SI prefixes.
  """
  @spec prefixes() :: list({atom() | nil, si_prefix() | nil, number()})
  def prefixes() do
    [
      {:yotta, :Y, 1_000_000_000_000_000_000_000_000},
      {nil, nil, 1_000_000_000_000_000_000_000_00},
      {nil, nil, 1_000_000_000_000_000_000_000_0},
      {:zetta, :Z, 1_000_000_000_000_000_000_000},
      {nil, nil, 1_000_000_000_000_000_000_00},
      {nil, nil, 1_000_000_000_000_000_000_0},
      {:exa, :E, 1_000_000_000_000_000_000},
      {nil, nil, 1_000_000_000_000_000_00},
      {nil, nil, 1_000_000_000_000_000_0},
      {:peta, :P, 1_000_000_000_000_000},
      {nil, nil, 1_000_000_000_000_00},
      {nil, nil, 1_000_000_000_000_0},
      {:tera, :T, 1_000_000_000_000},
      {nil, nil, 1_000_000_000_00},
      {nil, nil, 1_000_000_000_0},
      {:giga, :G, 1_000_000_000},
      {nil, nil, 1_000_000_00},
      {nil, nil, 1_000_000_0},
      {:mega, :M, 1_000_000},
      {nil, nil, 1_000_00},
      {nil, nil, 1_000_0},
      {:kilo, :k, 1000},
      {:hecto, :h, 100},
      {:deca, :da, 10},
      {:none, :none, 1},
      {:deci, :d, 0.1},
      {:centi, :c, 0.01},
      {:milli, :m, 0.001},
      {nil, nil, 0.0001},
      {nil, nil, 0.00001},
      {nil, nil, 0.000001},
      {nil, nil, 0.0000001},
      {nil, nil, 0.00000001},
      {:nano, :n, 0.000000001},
      {nil, nil, 0.0000000001},
      {nil, nil, 0.00000000001},
      {:pico, :p, 0.000000000001},
      {nil, nil, 0.0000000000001},
      {nil, nil, 0.00000000000001},
      {:femto, :f, 0.000000000000001},
      {nil, nil, 0.0000000000000001},
      {nil, nil, 0.00000000000000001},
      {:atto, :a, 0.000000000000000001},
      {nil, nil, 0.0000000000000000001},
      {nil, nil, 0.00000000000000000001},
      {:zepto, :z, 0.000000000000000000001},
      {nil, nil, 0.0000000000000000000001},
      {nil, nil, 0.00000000000000000000001},
      {:yocto, :y, 0.000000000000000000000001}
    ]
  end

  defp traverse([{:none, :none, 1} | _]) do
    [{:none, :none, 1} | []]
  end

  defp traverse([h | t]) do
    [h | traverse(t)]
  end

  defp dec_prefixes() do
    prefixes() |> Enum.reverse() |> traverse() |> Enum.reverse()
  end

  defp inc_prefixes() do
    traverse(prefixes()) |> Enum.reverse()
  end

  @doc """
  Returns index of SI prefix relative to base (non-)prefix position. Negative shift factor will have negative index, positive
  factor will have positive index.

  ## Examples

      iex> import ExKcal.SI
      iex> prefix_index(:m)
      -3
      iex> prefix_index(:M)
      6

  """
  @spec prefix_index(si_prefix()) :: integer()
  def prefix_index(prefix) do
    Enum.find_index(inc_prefixes(), fn {_, p, _} -> p == prefix end)
    || -Enum.find_index(dec_prefixes(), fn {_, p, _} -> p == prefix end)
  end

  @doc """
  Calculates shift required for prefix conversion.

  ## Examples

      iex> import ExKcal.SI
      iex> prefix_conversion_factor(:m, :M)
      -9
      iex> prefix_conversion_factor(:G, :m)
      12

  """
  @spec prefix_conversion_factor(si_prefix(), si_prefix()) :: integer()
  def prefix_conversion_factor(from, to) do
    (prefix_index(from) - prefix_index(to))
  end

  @doc """
  Extracts SI prefix from the unit.

  ## Examples

      iex> import ExKcal.SI
      iex> extract_prefix(:kg)
      :k
      iex> extract_prefix(:dag)
      :da

  """
  @spec extract_prefix(atom()) :: si_prefix()
  def extract_prefix(unit) when is_atom(unit) do
    _extract_prefix(Atom.to_string(unit))
  end

  # base
  defp _extract_prefix(<<_>>) do
    :none
  end

  defp _extract_prefix(<<s1, _s2>>) do
    String.to_atom(<<s1>>)
  end

  # special case: only two-letter prefix is `da`
  defp _extract_prefix(<<s1, s2, _s3>>) do
    String.to_atom(<<s1, s2>>)
  end
end
