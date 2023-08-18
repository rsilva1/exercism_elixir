defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    bool_map = map(list, fun)
    keep_zip(list, bool_map)
  end

  defguardp is_truthy(x) when not is_nil(x) and x != false

  defp map(list, fun), do: reverse(do_map(list, fun, []))
  defp do_map([], _fun, acc), do: acc
  defp do_map([head | tail], fun, acc), do: do_map(tail, fun, [fun.(head) | acc])

  defp keep_zip(list, bool_map), do: reverse(do_keep_zip(list, bool_map, []))
  defp do_keep_zip([], [], acc), do: acc
  defp do_keep_zip([h|t], [x|r], acc) when is_truthy(x), do: do_keep_zip(t,r,[h|acc])
  defp do_keep_zip([_h|t], [_|r], acc), do: do_keep_zip(t,r,acc)

  defp reverse(list), do: do_reverse(list, [])
  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: keep(list, &(not fun.(&1)))
end
