defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: do_numeral(number, "")
  defp do_numeral(0, roman), do: roman <> ""
  defp do_numeral(1, roman), do: roman <> "I"
  defp do_numeral(4, roman), do: roman <> "IV"
  defp do_numeral(5, roman), do: roman <> "V"
  defp do_numeral(9, roman), do: roman <> "IX"
  defp do_numeral(10, roman), do: roman <> "X"
  defp do_numeral(50, roman), do: roman <> "L"
  defp do_numeral(100, roman), do: roman <> "C"
  defp do_numeral(500, roman), do: roman <> "D"
  defp do_numeral(1000, roman), do: roman <> "M"
  defp do_numeral(number, roman) when number > 1000, do: roman <> convert_change(number, 1000, "M")
  defp do_numeral(number, roman) when number > 900, do: roman <> "CM" <> numeral(number-900)
  defp do_numeral(number, roman) when number > 500, do: roman <> convert_change(number, 500, "D")
  defp do_numeral(number, roman) when number > 400, do: roman <> "CD" <> numeral(number-400)
  defp do_numeral(number, roman) when number > 100, do: roman <> convert_change(number, 100, "C")
  defp do_numeral(number, roman) when number > 89, do: roman <> "XC" <> numeral(number-90)
  defp do_numeral(number, roman) when number > 50, do: roman <> convert_change(number, 50, "L")
  defp do_numeral(number, roman) when number > 39, do: roman <> "XL" <> numeral(number-40)
  defp do_numeral(number, roman) when number > 10, do: roman <> convert_change(number, 10, "X")
  defp do_numeral(number, roman) when number > 5, do: roman <> convert_change(number, 5, "V")
  defp do_numeral(number, roman) when number > 1, do: roman <> convert_change(number, 1, "I")
  defp do_numeral(_, _), do: raise RuntimeError, message: "unhandled number"

  defp convert_change(number, max_number, roman_max_number) do
    this_times = div(number, max_number)
    leftover   = rem(number, max_number)
    cond do
      this_times < 4 ->
        repeat(this_times, roman_max_number)
      true ->
        numeral(this_times) <> roman_max_number
    end <> numeral(leftover)
  end

  defp repeat(number, str) do
    cond do
      number === 2 ->
        str <> str
      number === 3 ->
        str <> str <> str
      true ->
        str
    end
  end
end
