defmodule KitchenCalculator do
  @unit_to_millis [
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
    milliliter: 1
  ]

  def get_volume({_, numeric}), do: numeric

  def to_milliliter({unit, amount}), do: {:milliliter, amount * @unit_to_millis[unit]}

  def from_milliliter({:milliliter, amount}, unit), do: {unit, amount / @unit_to_millis[unit]}

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
