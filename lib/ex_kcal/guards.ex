defmodule ExKcal.Guards do

  defguard is_non_neg_number(value) when is_number(value) and value >= 0

end
