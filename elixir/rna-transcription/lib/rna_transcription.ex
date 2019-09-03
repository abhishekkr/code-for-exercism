defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_rna(dna, '')
  end
  def to_rna([head|tail], rna) when head == 71 do ## 'G' => 71
    rna ++ 'C' ++ to_rna(tail)
  end
  def to_rna([head|tail], rna) when head == 67 do ## 'C' => 67
    rna ++ 'G' ++ to_rna(tail)
  end
  def to_rna([head|tail], rna) when head == 84 do ## 'T' => 84
    rna ++ 'A' ++ to_rna(tail)
  end
  def to_rna([head|tail], rna) when head == 65 do ## 'A' => 65
    rna ++ 'U' ++ to_rna(tail)
  end
  def to_rna([], rna) do
    rna
  end
  def to_rna(_, _) do
    raise RuntimeError, message: "DNA provided has non-supported characters"
  end
end
