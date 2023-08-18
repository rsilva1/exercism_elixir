defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number), do: do_factors_for(2, number, []) |> Enum.reverse()

  defp do_factors_for(_prime, number, primes) when number == 1, do: primes
  defp do_factors_for(prime, number, primes) when rem(number, prime) == 0 do
    do_factors_for(prime, div(number, prime), [prime | primes])
  end
  # Test until sqrt(number)
  defp do_factors_for(prime, number, primes) when prime * prime > number, do: [number | primes]
  # Minor opt to walk with a step of size 2
  defp do_factors_for(2, number, primes), do: do_factors_for(3, number, primes)
  defp do_factors_for(prime, number, primes), do: do_factors_for(prime + 2, number, primes)
end
