defmodule BirdCount do
  @busy_day_threshold 5

  def today(list) when list == [], do: nil
  def today([head | _tail]), do: head

  def increment_day_count(list) when list == [], do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list) when list == [], do: false
  def has_day_without_birds?([head | _tail]) when head == 0, do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  def total(list) when list == [], do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days(list) when list == [], do: 0
  def busy_days([head | tail]) when head >= @busy_day_threshold, do: 1 + busy_days(tail)
  def busy_days([_head | tail]), do: busy_days(tail)
end
