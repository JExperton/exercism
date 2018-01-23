defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    case {a, b} do
      {a, a} -> :equal
      {[], _} -> :sublist
      {_, []} -> :superlist
      {a, b} when length(a) == length(b) -> if a === b, do: :equal, else: :unequal
      {a, b} when length(a) > length(b) -> if compare(b, a) == :sublist, do: :superlist, else: :unequal
      _ -> if Enum.any?(0..(length(b) - length(a)), &(compare(Enum.slice(b, &1, length(a)), a) == :equal)), do: :sublist, else: :unequal
    end
  end
end