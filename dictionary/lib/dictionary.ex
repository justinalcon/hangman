defmodule Dictionary do

  alias Dictionary.Runtime.Server

  @opaque t :: Server.t

  @spec randomWordFromList() :: String.t
  defdelegate randomWordFromList(), to: Server, as: :random_word
end
