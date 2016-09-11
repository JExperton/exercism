defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless valid_nucleotide?(nucleotide) and valid_strand?(strand) do
      raise ArgumentError
    end
    Enum.count(strand, fn x -> x == nucleotide end)
   end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram([]), do: count_map
  def histogram(strand) do
    unless valid_strand?(strand) do
      raise ArgumentError
    end
    Enum.into(count_map, %{}, fn {x,y} -> {x, count(strand, x)} end)
  end


  @doc """
  Initialize a map according to the @nucleotides list

  iex> NucleotideCount.count_map
  %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
  """
  def count_map, do: Enum.into(@nucleotides, %{}, fn x -> {x, 0} end)

  def valid_strand?(strand), do: Enum.all?(strand, fn x -> valid_nucleotide?(x) end)

  def valid_nucleotide?(nucleotide), do: Enum.member?(@nucleotides, nucleotide)
end
