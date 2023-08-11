defmodule Darts do
  @type position :: {number, number}
  @inner_circle_radius 1
  @medium_circle_radius 5
  @outer_circle_radius 10
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    radius = (x ** 2 + y ** 2) ** (1 / 2)

    cond do
      radius <= @inner_circle_radius -> 10
      radius <= @medium_circle_radius -> 5
      radius <= @outer_circle_radius -> 1
      true -> 0
    end
  end
end
