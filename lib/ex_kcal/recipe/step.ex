defmodule ExKcal.Recipe.Step do

  @enforce_keys [:instructions, :time]
  defstruct(
    products: [],
    time: 0,
    instructions: "",
    notes: ""
  )

end
