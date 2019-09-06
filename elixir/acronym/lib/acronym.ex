defmodule Acronym do
  @doc """
  Check if a character is UpperCase alphabet or not.
  A => true
  $ => false
  """
  defmacro is_uppercase_alphabet(some_char) do
    quote do: (unquote(some_char) >= 65 and unquote(some_char) <= 90)
  end

  @doc """
  Check if a character is not a UpperCase/LowerCase alphabet.
  A => false
  a => false
  , => true
  """
  defmacro is_not_alphabet(some_char) do
    quote do: (
        (unquote(some_char) < ?A) or
        (unquote(some_char) > ?Z and unquote(some_char) < ?a) or
        (unquote(some_char) > ?z)
      )
  end

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    {first_char, tail_char} = Kernel.to_charlist(string)
                              |> List.pop_at(0)
    [first_char] ++ do_abbreviate(tail_char, '')
    |> to_string()
    |> String.upcase()
  end
  defp do_abbreviate([letter | tail], abbreviation) when is_uppercase_alphabet(letter) do
    do_abbreviate(tail, (abbreviation ++ [letter] ))
  end
  defp do_abbreviate([x | tail], abbreviation) when is_not_alphabet(x) do
    [letter | newtail] = tail
    if is_not_alphabet(letter) do
      do_abbreviate(newtail, abbreviation)
    else
      do_abbreviate(newtail, (abbreviation ++ [letter]))
    end
  end
  defp do_abbreviate([_ | tail], abbreviation), do: do_abbreviate(tail, abbreviation)
  defp do_abbreviate([], abbreviation), do: abbreviation
end
