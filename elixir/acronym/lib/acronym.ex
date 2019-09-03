defmodule Acronym do
  @doc """
  Check if a character is UpperCase alphabet or not.
  A => true
  $ => false
  """
  defmacro uppercase_alphabet?(some_char) do
    quote do: (unquote(some_char) >= 65 and unquote(some_char) <= 90)
  end

  @doc """
  Check if a character is not a UpperCase/LowerCase alphabet.
  A => false
  a => false
  , => true
  """
  defmacro not_alphabet?(some_char) do
    quote do: (
        (unquote(some_char) < 65) or
        (unquote(some_char) > 90 and unquote(some_char) < 97) or
        (unquote(some_char) > 122)
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
    [first_char] ++ abbreviate(tail_char, '')
    |> to_string()
    |> String.upcase()
  end
  def abbreviate([letter | tail], abbreviation) when uppercase_alphabet?(letter) do
    abbreviate(tail, (abbreviation ++ [letter] ))
  end
  def abbreviate([x | tail], abbreviation) when not_alphabet?(x) do
    [letter | newtail] = tail
    if not_alphabet?(letter) do
      abbreviate(newtail, abbreviation)
    else
      abbreviate(newtail, (abbreviation ++ [letter]))
    end
  end
  def abbreviate([_ | tail], abbreviation) do
    abbreviate(tail, abbreviation)
  end
  def abbreviate([], abbreviation) do
    abbreviation
  end
end
