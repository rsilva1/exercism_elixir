defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(elapsed_time) do
    expected_minutes_in_oven() - elapsed_time
  end

  def preparation_time_in_minutes(layers_count), do: layers_count * 2

  def total_time_in_minutes(layers_count, elapsed_time) do
    preparation_time_in_minutes(layers_count) + elapsed_time
  end

  def alarm, do: "Ding!"
end
