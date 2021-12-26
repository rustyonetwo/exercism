defmodule RationalNumbers do
  import Kernel, except: [abs: 1]
  require Math

  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({numerator_a, denominator_a}, {numerator_b, denominator_b}) do
    {numerator_a * denominator_b + numerator_b * denominator_a, denominator_a * denominator_b}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({numerator_a, denominator_a}, {numerator_b, denominator_b}) do
    {numerator_a * denominator_b - numerator_b * denominator_a, denominator_a * denominator_b}
    |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({numerator_a, denominator_a}, {numerator_b, denominator_b}) do
    {numerator_a * numerator_b, denominator_a * denominator_b}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({numerator_a, denominator_a}, {numerator_b, denominator_b}) when numerator_b != 0 do
    {numerator_a * denominator_b, numerator_b * denominator_a}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    import Kernel, only: [abs: 1]

    reduce({Kernel.abs(a), Kernel.abs(b)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_a, 0), do: {1, 1}

  def pow_rational({a, b}, n) when n > 0 do
    {Integer.pow(a, n), Integer.pow(b, n)}
    |> reduce()
  end

  def pow_rational({a, b}, n) when n < 0 do
    {Integer.pow(b, abs(n)), Integer.pow(a, abs(n))}
    |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(_x, {0, _b}), do: 1.0

  def pow_real(x, {numerator, denominator}) do
    Math.pow(numerator, x) / Math.pow(denominator, x)

  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    greatest_common_divisor = Integer.gcd(a, b)
    {a / greatest_common_divisor, b / greatest_common_divisor}
  end
end
