defmodule RationalNumbers do
  @type rational :: {integer, integer}

  import Kernel, except: [abs: 1]

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    multiply(num, invert(den)) |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    {Kernel.abs(num), Kernel.abs(den)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) when n >= 0 do
    {num, den} = a
    {num ** n, den ** n} |> reduce()
  end

  def pow_rational(a, n) when n < 0, do: pow_rational(invert(a), -n)

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}), do: x ** (num / den)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, den}) do
    d = gcd(Kernel.abs(num), Kernel.abs(den))
    {div(num, d), div(den, d)} |> normalize_sign()
  end

  @spec gcd(a :: integer, b :: integer) :: integer
  defp gcd(a, b) when a < b, do: gcd(b, a)
  defp gcd(a, b) when b == 0, do: a
  defp gcd(a, b) when rem(a, b) == 0, do: b
  defp gcd(a, b), do: gcd(b, rem(a, b))

  defp invert({num, den}), do: {den, num}

  defp normalize_sign({num, den}) when den < 0, do: {-num, -den}
  defp normalize_sign({num, den}), do: {num, den}
end
