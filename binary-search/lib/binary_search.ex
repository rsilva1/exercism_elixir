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
  def search(numbers, key), do: binary_search(numbers, 0, tuple_size(numbers), div(tuple_size(numbers), 2), key)

  defp binary_search(_tuple, first, last, _mid, _key) when first >= last, do: :not_found
  defp binary_search(tuple, _first, _last, mid, key) when elem(tuple, mid) == key, do: {:ok, mid}
  defp binary_search(tuple, first, _last, mid, key) when key < elem(tuple, mid) do
    binary_search(tuple, first, mid, div(first + mid, 2), key)
  end
  defp binary_search(tuple, _first, last, mid, key) do
    binary_search(tuple, mid + 1, last, div(mid + 1 + last, 2), key)
  end
end
