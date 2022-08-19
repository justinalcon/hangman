defmodule B2Web.Live.Game.Wordsofar do

  use B2Web, :live_component
  @states %{
    initializing: "Guess the word, one letter per guess",
    good_guess: "Good Guess!",
    bad_guess: "Nope.",
    won: "Winner winner, Chicken Dinner.",
    lost: "We can't all be winners.",
    already_used: "We've already tried that one."
  }
  def mount(socket) do
    {:ok, socket}
  end

  defp state_name(state) do
      @states[state] || "State of Confusion"
  end

  def render(assigns) do
    ~L"""
    <div class="word-so-far">
      <div class="game-state">
        <%= @game_state |> state_name() %>
      </div>
      <div class="letters">
        <%= for ch <- @letters do %>
          <div class="one-letter <%= if ch != "_", do: "correct" %>">
            <%= ch %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

end
