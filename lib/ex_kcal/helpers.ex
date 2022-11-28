defmodule ExKcal.Helpers do
  # TODO
  def decode(string) when string in ["none", "kg", "g", "mg", "μg", "l", "dl", "ml"], do: String.to_atom(string)
  def decode([amount, unit]) when is_bitstring(unit), do: {amount, decode(unit)}
  def decode({amount, unit}) when is_bitstring(unit), do: {amount, decode(unit)}
  def decode(term), do: term
end
