defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    String.graphemes(string)
    |> Enum.chunk_by(&(&1))
    |> Enum.map_join(&("#{length(&1)}#{hd(&1)}"))
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\D)/, string)
    |> Enum.map_join(fn [_, count, grapheme]
      -> String.duplicate(grapheme, String.to_integer(count)) end)
  end
end
