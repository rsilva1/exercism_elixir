defmodule DNA do
  @bitlen 4

  @nucleotide_to_code %{
    ?\s => 0,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
  }

  @code_to_nucleotide %{
    0 => ?\s,
    0b0001 => ?A,
    0b0010 => ?C,
    0b0100 => ?G,
    0b1000 => ?T,
  }

  def encode_nucleotide(code_point), do: @nucleotide_to_code[code_point]

  def decode_nucleotide(encoded_code), do: @code_to_nucleotide[encoded_code]

  @spec encode(list) :: bitstring
  def encode(dna), do: do_encode(dna, <<>>)

  @spec decode(bitstring) :: [non_neg_integer()]
  def decode(dna), do: do_decode(dna, []) |> do_reverse([])

  defp do_encode([], acc), do: acc
  defp do_encode([code_point | tail], acc) do
    do_encode(tail, <<acc::bitstring, encode_nucleotide(code_point)::size(@bitlen)>>)
  end

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<encoded_code::size(@bitlen), tail::bitstring>>, acc) do
    do_decode(tail, [decode_nucleotide(encoded_code) | acc])
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])
end
