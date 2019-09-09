defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> do_translate([])
    |> Enum.join(" ")
  end
  defp do_translate([], words), do: words
  defp do_translate([head | tail], words), do: do_translate(tail, words ++ [to_pig(head)])

  defp to_pig(word) do
    cond do
      Regex.match?(~r/^([a|e|i|o|u]|([xy][^a|^e|^i|^o|^u])).*$/, word) ->
        word <> "ay"
      Regex.match?(~r/^[^a|^e|^i|^o|^u]*qu.*$/, word) ->
        [[_, fst, lst]] = Regex.scan(~r/^([^a|^e|^i|^o|^u]*qu)(.*)$/, word)
        lst <> fst <> "ay"
      Regex.match?(~r/^[^a|^e|^i|^o|^u]*y.*$/, word) ->
        [[_, fst, lst]] = Regex.scan(~r/^([^a|^e|^i|^o|^u]*)y(.*)$/, word)
        lst <> "y" <> fst <> "ay"
      Regex.match?(~r/^.y.*$/, word) ->
        [[_, fst, lst]] = Regex.scan(~r/^(.)y(.*)$/, word)
        "y" <> lst <> fst <> "ay"
      Regex.match?(~r/^[^a|^e|^i|^o|^u]+.*$/, word) ->
        [[_, fst, lst]] = Regex.scan(~r/^([^a|^e|^i|^o|^u]+)(.*)$/, word)
        lst <> fst <> "ay"
      true ->
        word
    end
  end
end
