defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) -> "Fine. Be that way!"
      yelling_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp question?(input) do
    Regex.match?(~r/\?$/, input)
  end

  defp yelling?(input) do
    Regex.match?(~r/\p{L}+/u, input) and
    !Regex.match?(~r/\p{Ll}+/u, input)
  end

  defp yelling_question?(input) do
    yelling?(input) and question?(input)
  end

  defp silent?(input) do
    String.trim(input) == ""
  end
end
