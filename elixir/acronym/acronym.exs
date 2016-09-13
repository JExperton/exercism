defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.replace(string, ~r/(?<!\s)\p{Ll}|[^\p{L}]/, "")
    |> String.upcase 
  end
end
