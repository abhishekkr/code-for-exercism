defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, strsize) when strsize < 1, do: []
  def slices(str, strsize) do
    cond do
      String.length(str) >= strsize ->
        [String.slice(str, 0..(strsize-1))] ++ slices(String.slice(str, 1..-1), strsize)
      true ->
        []
    end
  end
end
