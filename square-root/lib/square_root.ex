defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    Stream.unfold(1, &({&1, &1 + 1}))
    |> Stream.take_while(&(&1 * &1 <= radicand))
    |> Stream.take(-1)
    |> Enum.to_list() |> List.first()
  end
end
