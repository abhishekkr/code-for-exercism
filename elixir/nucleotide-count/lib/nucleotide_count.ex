defmodule NucleotideCount do
  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count([], _), do: 0
  def count([head | tail], nucleotide) when head == nucleotide, do: 1 + count(tail, nucleotide)
  def count([_ | tail], nucleotide), do: count(tail, nucleotide)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand), do: do_histogram(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0})
  defp do_histogram([], strand_count), do: strand_count
  defp do_histogram([head | tail], strand_count) do
    {:ok, updated_count} = Map.get_and_update(strand_count, head, &({:ok, &1 + 1}))
    do_histogram(tail, updated_count)
  end
end
