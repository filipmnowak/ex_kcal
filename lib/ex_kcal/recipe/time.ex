defmodule ExKcal.Recipe.Time do
  @moduledoc """
  Amount of time to be included in `ExKcal.Recipe` instructions. As hinted already, module provides structure and primitives to handle
  amount of time, and not the current time etc. That fact dictates names of the struct fields: `hours`, `minutes` and finally
  `seconds`.
  """

  defstruct(hours: 0, minutes: 0,  seconds: 0)

  @typedoc """
  Amount of time is sum of all of the fields.
  """
  @type t :: %__MODULE__{hours: Calendar.hour(), minutes: Calendar.minute(), seconds: Calendar.second()}

end
