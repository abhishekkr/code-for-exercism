defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> Kernel.to_charlist
    |> word_count(%{}, [])
  end

  @doc """
  Extract all words from text.
  """
  @spec word_count(characters :: [char], wc :: map, word :: [char]) :: [String.t()]
  defp word_count([], wc, []), do: wc
  defp word_count([], wc, word) do
    wordkey = word |> to_string |> String.downcase
    cond do
      wc[wordkey] |> is_nil ->
        Map.put(wc, wordkey, 1)
      true ->
        %{wc | wordkey => (wc[wordkey]+1)}
    end
  end
  defp word_count([head | tail], wc, []) when head == ?\  or head == ?_, do: word_count(tail, wc, [])
  defp word_count([head | tail], wc, word) when head == ?\  or head == ?_ do
    new_wc = word_count([], wc, word)
    word_count(tail, new_wc, [])
  end
  defp word_count([head | tail], wc, word) do
    cond do
      allowed?(head) ->
        word_count(tail, wc, word ++ [head])
      true ->
        word_count(tail, wc, word)
    end
  end

  @spec allowed?(character :: char) :: bool
  defp allowed?(character), do: Regex.match?(~r/[\pL\pN-]/, << character :: utf8 >>)
end
