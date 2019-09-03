defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count([], nucleotide) do
    0
  end
  def count([head|tail], nucleotide) when head == nucleotide do
    1 + count(tail, nucleotide)
  end
  def count([_|tail], nucleotide) do
    count(tail, nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  end

  @spec histogram([char], {}) :: map
  def histogram([], strand_count) do
    strand_count
  end
  def histogram([head|tail], strand_count) do
    {:ok, updated_count} = Map.get_and_update(strand_count, head, &({:ok, &1 + 1}))
    histogram(tail, updated_count)
  end
end
