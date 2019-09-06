defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> Kernel.to_charlist
    |> wordcount(%{}, [])
  end

  @doc """
  Extract all words from text.
  """
  @spec wordcount(characters :: [char], wc :: map, word :: [char]) :: [String.t()]
  defp wordcount([], wc, []), do: wc
  defp wordcount([], wc, word) do
    wordkey = word |> to_string |> String.downcase
    cond do
      wc[wordkey] |> is_nil ->
        Map.put(wc, wordkey, 1)
      true ->
        %{wc | wordkey => (wc[wordkey]+1)}
    end
  end
  defp wordcount([head | tail], wc, []) when head == ?\  or head == ?_, do: wordcount(tail, wc, [])
  defp wordcount([head | tail], wc, word) when head == ?\  or head == ?_ do
    new_wc = wordcount([], wc, word)
    wordcount(tail, new_wc, [])
  end
  defp wordcount([head | tail], wc, word) do
    cond do
      allowed?(head) ->
        wordcount(tail, wc, word ++ [head])
      true ->
        wordcount(tail, wc, word)
    end
  end

  @spec allowed?(character :: char) :: bool
  defp allowed?(character), do: Regex.match?(~r/[\pL\pN-]/, << character :: utf8 >>)
end
