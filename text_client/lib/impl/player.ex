defmodule TextClient.Impl.Player do

  @type game :: Hangman.game
  @type tally :: Hangman.tally
  @type state :: { game, tally }

  @spec start(game) :: :ok
  def start(game) do
    tally = Hangman.tally(game)
    interact({ game, tally })
  end

  @spec interact(state) :: :ok
  def interact({_game, _tally = %{ game_state: :won }}) do
    IO.puts "congratulations. You've won."
  end
  def interact({game, _tally = %{ game_state: :lost }}) do
    IO.puts "Sorry you've lost... the word was #{ game.letters |> Enum.join}"
  end
  def interact({game, tally}) do
    #feedback on state good or bad guess etc
    IO.puts feedback_for(tally)
    #display current word
    IO.puts current_word(tally)
    #get next guess + #make move
    # why do I have to do this replace and he does not?
    tally = Hangman.make_move(game, String.replace(get_guess(),"\n",""))
    interact({game, tally})
  end

  def get_guess() do
    IO.gets "Next letter: "
    |> String.trim()
    |> String.downcase
  end

  def feedback_for(tally = %{ game_state: :initializing}) do
      "Welcome! I'm thinking of a word with #{tally.letters |> length} letters"
  end

  def feedback_for(_tally = %{ game_state: :good_guess}), do: "Good guess!"
  def feedback_for(_tally = %{ game_state: :bad_guess}), do: "Sorry that letter is not in the word"
  def feedback_for(_tally = %{ game_state: :already_used}), do: "That letter has already been guessed."

  def current_word(tally) do
    [
    "Word so far: ", tally.letters |> Enum.join(" "),
    " turns left: ", tally.turns_left |> to_string,
    " used so far: ", tally.used |> Enum.join(",")
    ]
  end


end
