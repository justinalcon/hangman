defmodule Dictionary.Impl.WordList do

  @alias Dictionary.Impl.WordList
  @type t :: list(String)

  @spec start() :: t
  def start do
  "assets/words.txt"
    |> File.read!
    |> String.split
  end

  @spec randomWordFromList(t) :: String.t
  def randomWordFromList(list) do
    list |> Enum.random
  end
end
