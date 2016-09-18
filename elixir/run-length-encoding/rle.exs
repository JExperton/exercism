defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    String.graphemes(string) |> encodeR("")
  end

  @spec encodeR(List.t, String.t) :: String.t
  def encodeR([], acc), do:  acc
  def encodeR(graphemes, acc) do
    [same|rest] = Enum.split_while(graphemes, &(&1 == Enum.at(graphemes, 0))) |> Tuple.to_list
    encodeR(List.first(rest), acc <> "#{Enum.count(same)}#{List.first(same)}")
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.split(string, ~r/\d+\D/, include_captures: true, trim: true)
    |> Enum.map_join("", &(decodeR(&1)))
  end

  @spec decodeR(String.t) :: String.t
  def decodeR(string) do
    [h|t] = String.split(string, ~r/\D/, include_captures: true, trim: true)
    List.duplicate(t, String.to_integer(h)) |> Enum.join
  end
end
