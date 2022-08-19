defmodule B1Web.HangmanView do
  use B1Web, :view

  def figure_for(0) do
      ~s{
         _____
'    \\\\
    O//
    \\_\\
    | |
   /  |
  /   |
      }
  end

  def figure_for(1) do
      ~s{

    O//
    \\_\\
    | |
   /  |
  /   |
      }
  end

  def figure_for(2) do
      ~s{


    \\_\\
    | |
   /  |
  /   |
      }
  end

  def figure_for(3) do
      ~s{


    | |
   /  |
  /   |
      }
  end

  def figure_for(4) do
      ~s{


   /  |
  /   |
      }
  end

  def figure_for(5) do
      ~s{



  /   |
      }
  end

  def figure_for(6) do
      ~s{



  /   |
      }
  end

  def figure_for(7) do
      ~s{



      }
  end

  @status_fields %{
    initializing: {"initializing", "Guess the word, one letter per guess"},
    good_guess: {"good-guess", "Good Guess!"},
    bad_guess: {"bad-guess", "Nope."},
    won: {"won", "Winner winner, Chicken Dinner."},
    lost: {"lost", "We can't all be winners."},
    already_used: {"already-used", "We've already tried that one."}
  }

  def move_status(status) do
    { class, message } = @status_fields[status]
    "<div class='status #{class}'>#{message}</div>"
  end

  def continue_or_try_again(conn, status) when status in [:won,:lost] do
    button "New Game", to: Routes.hangman_path(conn, :new)
  end

  def continue_or_try_again(conn, _) do
    form_for(conn, Routes.hangman_path(conn, :update), [as: "make_move", method: :put], fn f ->
        [text_input(f,:guess,autofocus: "true"),
        submit("Make next guess")]
      end)
  end
end
