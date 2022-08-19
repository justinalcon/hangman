defmodule Procs do
  def hello(count) do
    receive do
      { :crash, reason} ->
        exit(reason)
      {:quit} ->
        IO.puts "peace and I am out. (drops mic)"
      { :add, n } ->
        hello(count+n)
      msg ->
        IO.puts("#{count}: Helloo #{inspect msg}")
        hello(count + 1)
     end
  end
end
