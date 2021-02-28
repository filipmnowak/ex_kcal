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

  def keys() do
    [
      ["Name", :name],
      ["Synonyms", :note],
      ["Category", :description],
      ["Matrix unit", [:weigth, :volume]],
      ["Energy, kilocalories (kcal)", :kcal],
      ["Fat, total (g)", {:fats, :total}],
      ["Fatty acids, saturated (g)", {:fats, :saturated}],
      ["Fatty acids, monounsaturated (g)", {:fats, :monounsaturated}],
      ["Fatty acids, polyunsaturated (g)", {:fats, :polyunsaturated}],
      ["Carbohydrates, available (g)", {:carbs, :total}],
      ["Sugars (g)", {:carbs, :sugars}],
      ["Starch (g)", {:carbs, :starch}],
      ["Dietary fibres (g)", {:carbs, :diatery_fiber}],
      ["Protein (g)", :proteins],
      ["Salt (NaCl) (g)", :salt],
      ["Alcohol (g)", {:alcohols, :total}],
      ["Wasser (g)", :water],
      ["Vitamin A activity, RE (µg-RE)", {:vitamins, ""}],
      ["Vitamin A activity, RAE (µg-RE)", {:vitamins, ""}],
      ["All-trans retinol equivalents (µg-RE)", {:vitamins, ""}],
      ["Beta- carotene activity (µg-BCE)", {:vitamins, ""}],
      ["Beta-carotene (µg)", {:vitamns, ""}],
      ["Vitamin B1 (thiamine) (mg)", {:vitamins, "vitamin_b1"}],
      ["Vitamin B2 (riboflavin) (mg)", {:vitamins, "vitamin_b2"}],
      ["Vitamin B6 (pyridoxine) (mg)", {:vitamins, "vitamin_b6"}],
      ["Vitamin B12 (cobalamin) (µg)", {:vitamins, "vitamin_b12"}],
      ["Vitamin C (ascorbic acid) (mg)", {:vitamins, "vitamin_c"}],
      ["Vitamin D (calciferol) (µg)", {:vitamins, "vitamin_d"}],
      ["Vitamin E activity (mg-ATE)", {:vitamins,"vitamin_e"}],
      ["Potassium (K) (mg)", {:minerals, "potassium"}],
      ["Sodium (Na) (mg)", {:minerals, "sodium"}],
      ["Chloride (Cl) (mg)", {:minerals, "chloride"}],
      ["Calcium (Ca) (mg)", {:minerals, "calcium"}],
      ["Magnesium (Mg) (mg)", {:minerals, "magnesium"}],
      ["Phosphorus (P) (mg)", {:minerals, "phosphorus"}],
      ["Iron (Fe) (mg)", {:minerals, "iron"}],
      ["Iodide (I) (µg)", {:minerals, "iodide"}],
      ["Zinc (Zn) (mg)", {:minerals, "zinc"}],
      ["Selenium (Se) (µg)", {:minerals, "selenium"}]
    ]
  end

  def map(column, mapping \\ &KcalCount.Import.keys/0) when is_integer(column) and column > 0 do
    mapping = mapping.()
    cond do
      length(mapping) < column -> {:err, :out_of_bounds}
      :else ->
        {:ok, mapping
        |> List.to_tuple()
        |> elem(column)}
    end
  end

  def get_unit(key) when is_bitstring(key) do
    case Regex.run(~r/\([^)]+\)$/, key, capture: :first) do
      ["(g)"] -> :g
      ["(mg)"] -> :mg
      ["(µg)"] -> :µg
      _ -> :"n/a"
    end
  end

  def swiss_food_composition_database_V6_1_csv(
    path \\ "data/Swiss-food-composition-database-V6.1.csv",
    get_data \\ &get_data/1,
    deserialize \\ &deserialize/1,
    filter \\ &filter/1,
    map \\ &map/2
  ) do
    products = KcalCount.Products.init()
    data = path
    |> get_data.()
    |> deserialize.()
    |> filter.()
  end
end
