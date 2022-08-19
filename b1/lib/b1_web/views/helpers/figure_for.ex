
defmodule B1Web.HangmanView.Helpers.FigureFor do
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
end
