defmodule Knapsack do
  @memo %{}
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value(items, _maximum_weight) when items == [], do: 0

  def maximum_value(items, maximum_weight) do
    n = length(items)

    if is_map_key(@memo, {n, maximum_weight}) do
      Map.get(@memo, {n, maximum_weight})
    else
      [item | other_items] = items

      take_item_value =
        if maximum_weight >= item.weight do
          item.value + maximum_value(other_items, maximum_weight - item.weight)
        else
          0
        end

      leave_item_value = maximum_value(other_items, maximum_weight)

      answer = max(take_item_value, leave_item_value)
      Map.put(@memo, {n, maximum_weight}, answer)
      answer
    end
  end
end
