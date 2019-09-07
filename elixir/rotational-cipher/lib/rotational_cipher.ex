defmodule RotationalCipher do
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
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> Kernel.to_charlist()
    |> Enum.map(&(rotate_alphabet(&1, shift)))
    |> to_string()
  end

  @spec rotate_alphabet(alphabet :: char, shift :: integer) :: char
  defp rotate_alphabet(c, _) when is_not_alphabet(c), do: c
  defp rotate_alphabet(alphabet, shift) when (alphabet <= ?Z and (alphabet + shift) <= ?Z) or (alphabet >= ?a and (alphabet + shift) <= ?z) do
    alphabet + shift
  end
  defp rotate_alphabet(alphabet, shift) do
    alphabet + shift - 26
  end
end
