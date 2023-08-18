defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)

  defp do_count([], acc), do: acc
  defp do_count([_head | tail], acc), do: do_count(tail, 1 + acc)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(l, f, []) |> reverse()

  defp do_map([], _f, acc), do: acc
  defp do_map([head | tail], f, acc), do: do_map(tail, f, [f.(head) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    bool_map = map(l, f)
    do_filter(l, bool_map, []) |> reverse()
  end

  defguardp is_truthy(x) when not is_nil(x) and x != false

  defp do_filter([], [], acc), do: acc
  defp do_filter([h | t], [bh | bt], acc) when is_truthy(bh), do: do_filter(t, bt, [h | acc])
  defp do_filter([_ | t], [_ | bt], acc), do: do_filter(t, bt, acc)

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f), do: do_foldl(l, acc, f)

  defp do_foldl([], acc, _f), do: acc
  defp do_foldl([head | tail], acc, f), do: do_foldl(tail, f.(head, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: l |> reverse() |> foldl(acc, f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(b, a |> reverse())

  defp do_append(acc, []), do: acc
  defp do_append(acc, [head | tail]), do: do_append([head | acc], tail)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll |> reverse(), [])

  defp do_concat([], acc), do: acc
  defp do_concat([head | tail], acc), do: do_concat(tail, append(head, acc))
end
