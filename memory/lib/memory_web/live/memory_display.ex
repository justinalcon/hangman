defmodule MemoryWeb.Live.MemoryDisplay do
  use MemoryWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, schedule(socket) }
  end

  def render(assigns) do
    ~L"""
      <table>
      <%= for {name, value} <- assigns.memory do %>
        <tr>
          <th><%= name %></th>
          <td><%= value %></td>
        </tr>
      <% end %>
      </table>
    """
  end

  defp schedule(socket) do
    Process.send_after(self(), :tick, 1000)
    assign(socket, :memory, :erlang.memory())
  end

  def handle_info(:tick, socket) do
    {:noreply, schedule(socket) }
  end
end
