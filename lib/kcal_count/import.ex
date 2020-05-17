defmodule KcalCount.Import do

  def get_data(path) do
    File.read!(path)
  end

  def deserialize(raw_data, eol \\ "\n", separator \\ "@") do
    raw_data
    |> String.split(eol)
    |> Enum.map(fn line -> String.split(line, separator) end)
  end

  def filter(data) do
    exclude_rows = [1, 2]
    # row or column num == row or column index + 1
    include_columns = [
      4, 5, 6, 8, 12, 15, 18, 21, 24, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63,
      66, 69, 72, 75, 78, 90, 93, 96, 99, 102, 105, 108, 111, 114, 117, 120, 123, 126
    ]
    Enum.reduce(
      Enum.sort(exclude_rows)
      |> Enum.reverse(),
      data,
      &(List.delete_at(&2, &1 - 1))
    )
    |> Enum.filter(
      &(&1 !== [""])
    )
    |> Enum.map(
      fn line ->
        Enum.map(
          include_columns,
          &(elem(List.to_tuple(line), &1 - 1))
        )
      end
    )
  end

  def map(data, product) do
    keys = %{
      "Name": :name,
      "Synonyms": :note,
      "Category": :description,
      "Matrix unit": [:weigth, :volume],
      "Energy, kilocalories (kcal)": :kcal,
      "Fat, total (g)": :total,
      "Fatty acids, saturated (g)": :saturated,
      "Fatty acids, monounsaturated (g)": :monounsaturated,
      "Fatty acids, polyunsaturated (g)": :polyunsaturated,
      "Carbohydrates, available (g)": :total,
      "Sugars (g)": :sugars,
      "Starch (g)": :starch,
      "Dietary fibres (g)": :diatery_fiber,
      "Protein (g)": :proteins,
      "Salt (NaCl) (g)": :salt,
      "Alcohol (g)": :total,
      "Wasser (g)": :water,
      "Vitamin A activity, RE (µg-RE)": "",
      "Vitamin A activity, RAE (µg-RE)": "",
      "All-trans retinol equivalents (µg-RE)": "",
      "Beta- carotene activity (µg-BCE)": "",
      "Beta-carotene (µg)": "",
      "Vitamin B1 (thiamine) (mg)": "vitamin_b1",
      "Vitamin B2 (riboflavin) (mg)": "vitamin_b2",
      "Vitamin B6 (pyridoxine) (mg)": "vitamin_b6",
      "Vitamin B12 (cobalamin) (µg)": "vitamin_b12",
      "Vitamin C (ascorbic acid) (mg)": "vitamin_c",
      "Vitamin D (calciferol) (µg)": "vitamin_d",
      "Vitamin E activity (mg-ATE)": "vitamin_e",
      "Potassium (K) (mg)": "potassium",
      "Sodium (Na) (mg)": "sodium",
      "Chloride (Cl) (mg)": "chloride",
      "Calcium (Ca) (mg)": "calcium",
      "Magnesium (Mg) (mg)": "magnesium",
      "Phosphorus (P) (mg)": "phosphorus",
      "Iron (Fe) (mg)": "iron",
      "Iodide (I) (µg)": "iodide",
      "Zinc (Zn) (mg)": "zinc",
      "Selenium (Se) (µg)": "selenium"
    }
  end

  def swiss_food_composition_database_V6_1_csv(
    path \\ "data/Swiss-food-composition-database-V6.1.csv",
    get_data \\ &get_data/1,
    deserialize \\ &deserialize/1,
    filter \\ &filter/1,
    map \\ &map/2
  ) do
    product = %KcalCount.Product{}
    path
    |> get_data.()
    |> deserialize.()
    |> filter.()
    |> map.(product)
  end
end
