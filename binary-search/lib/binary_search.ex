defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, _key) when numbers == {}, do: :not_found

  def search(numbers, key) do
    n = tuple_size(numbers)
    idx = div(n, 2)
    mid_element = elem(numbers, idx)

    cond do
      mid_element == key -> {:ok, idx}
      mid_element < key -> search(Enum.slice(numbers, 0, idx - 1), key)
      true -> search(Enum.slice(numbers, (idx + 1)..(n - 1)), key)
    end
  end
end
