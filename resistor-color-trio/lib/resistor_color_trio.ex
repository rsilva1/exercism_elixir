defmodule ResistorColorTrio do
  @type resistance_unit :: :ohms | :kiloohms | :megaohms | :gigaohms

  @color_to_code %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, resistance_unit}
  def label(colors) do
    meaningful_colors = Enum.slice(colors, 0..1)
    power_color = List.last(colors)
    meaningless_colors_length = length(colors) - 3

    power = @color_to_code[power_color] + meaningless_colors_length

    raw_resistance = colors_to_integer(meaningful_colors)
    {simplified_resistance, extra_power} = reduce_resistance_power(raw_resistance)

    power = power + extra_power

    {power_correction(simplified_resistance, power), power_to_unit(power)}
  end

  # Removes right most zeroes from resistance.
  # The amount of zeroes removed is returned in second element of tuple
  # Ex: {2000, 0} -> {2, 3}
  @spec reduce_resistance_power(resistance :: integer, power :: integer) ::
          {resistance :: integer, power :: integer}
  defp reduce_resistance_power(resistance, power \\ 0)

  defp reduce_resistance_power(resistance, power)
       when resistance == 0 or rem(resistance, 10) != 0,
       do: {resistance, power}

  defp reduce_resistance_power(resistance, power),
    do: reduce_resistance_power(div(resistance, 10), power + 1)

  @spec colors_to_integer(colors :: [atom]) :: integer
  defp colors_to_integer(colors) do
    colors
    |> Enum.map_join("", &@color_to_code[&1])
    |> String.to_integer()
  end

  @spec power_correction(resistance :: integer, power :: integer) :: integer
  defp power_correction(resistance, power), do: resistance * 10 ** rem(power, 3)

  @spec power_to_unit(power :: integer) :: resistance_unit
  defp power_to_unit(power) when power >= 9, do: :gigaohms
  defp power_to_unit(power) when power >= 6, do: :megaohms
  defp power_to_unit(power) when power >= 3, do: :kiloohms
  defp power_to_unit(_power), do: :ohms
end
