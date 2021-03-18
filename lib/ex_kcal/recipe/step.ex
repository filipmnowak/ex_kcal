defmodule ExKcal.Recipe.Step do
  @moduledoc """
  `ExKcal.Recipe` step.
  """

  alias ExKcal.Recipe.Step
  alias ExKcal.Recipe.Time, as: RecipeTime
  alias ExKcal.Products

  @enforce_keys [:instructions, :time]
  defstruct(
    products: Products.new(),
    time: %RecipeTime{},
    instructions: "",
    notes: ""
  )

  @type t :: %__MODULE__{
          products: Products.t(),
          time: RecipeTime.t(),
          instructions: String.t(),
          notes: String.t()
        }

  @doc """
  Construct new `ExKcal.Recipe.Step` instance.
  """
  @spec new(String.t(), RecipeTime.t()) :: t()
  def new(instructions, time) when is_bitstring(instructions) and is_struct(time, RecipeTime) do
    %Step{instructions: instructions, time: time}
  end
end
