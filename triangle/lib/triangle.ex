defmodule Triangle do
  @non_positive_side_error "all side lengths must be positive"
  @triangle_inequality_error "side lengths violate triangle inequality"
  @equilateral :equilateral
  @isosceles :isosceles
  @scalene :scalene

  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      not all_sides_positive?(a, b, c) -> {:error, @non_positive_side_error}
      not triangle_inequality?(a, b, c) -> {:error, @triangle_inequality_error}
      equilateral?(a, b, c) -> {:ok, @equilateral}
      isosceles?(a, b, c) -> {:ok, @isosceles}
      true -> {:ok, @scalene}
    end
  end

  @spec equilateral?(number, number, number) :: boolean()
  defp equilateral?(a, b, c), do: a == b and b == c

  @spec isosceles?(number, number, number) :: boolean()
  defp isosceles?(a, b, c), do: a == b or b == c or a == c

  @spec all_sides_positive?(number, number, number) :: boolean()
  defp all_sides_positive?(a, b, c), do: a > 0 and b > 0 and c > 0

  @spec triangle_inequality?(number, number, number) :: boolean()
  defp triangle_inequality?(a, b, c), do: 2 * max(a, max(b, c)) < a + b + c
end
