defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: do_to_rna(dna, '')
  defp do_to_rna([?G | tail], rna), do: rna ++ 'C' ++ to_rna(tail)
  defp do_to_rna([?C | tail], rna), do: rna ++ 'G' ++ to_rna(tail)
  defp do_to_rna([?T | tail], rna), do: rna ++ 'A' ++ to_rna(tail)
  defp do_to_rna([?A | tail], rna), do: rna ++ 'U' ++ to_rna(tail)
  defp do_to_rna([], rna), do: rna
  defp do_to_rna(_, _), do: raise RuntimeError, message: "DNA provided has non-supported characters"
end
