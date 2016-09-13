defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.replace(string, ~r/((?<=\p{Ll})\p{Lu})/, " \\1")
    |> String.split(~r/[\s-]/)
    |> Enum.map(&(String.first(&1) |> String.capitalize))
    |> Enum.join
  end
end
