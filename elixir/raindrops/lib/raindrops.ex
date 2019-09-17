defmodule Raindrops do
  @pling 3
  @plang 5
  @plong 7
  @pling_plang (@pling * @plang)
  @pling_plong (@pling * @plong)
  @plang_plong (@plang * @plong)
  @pling_plang_plong (@pling * @plang * @plong)


  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) when rem(number, @pling_plang_plong) === 0, do: "PlingPlangPlong"
  def convert(number) when rem(number, @plang_plong) === 0, do: "PlangPlong"
  def convert(number) when rem(number, @pling_plong) === 0, do: "PlingPlong"
  def convert(number) when rem(number, @pling_plang) === 0, do: "PlingPlang"
  def convert(number) when rem(number, @plong) === 0, do: "Plong"
  def convert(number) when rem(number, @plang) === 0, do: "Plang"
  def convert(number) when rem(number, @pling) === 0, do: "Pling"
  def convert(number),do: number |> to_string
end
