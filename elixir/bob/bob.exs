defmodule Bob do

  def hey(input) do
    String.replace(input, ~r/[^\w\d\?]/, "") |> answer
  end

  def answer(input) do
    cond do
        String.match?(input, ~r/^\s*$/) -> "Fine. Be that way!"
        String.last(input) == "?" -> "Sure."
        !String.match?(input, ~r/\D/)   -> "Whatever."
        !String.match?(input, ~r/[^\p{Lu}\d]/) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
