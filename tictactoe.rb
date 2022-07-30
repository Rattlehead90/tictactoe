class Player

  attr_reader :name

  def initialize(name, score = 0)
    @name = name
    @score = score
  end
end

class Board 
  def show
    puts row = ["   " "|" "   " "|" "   "]
    puts separator = "-----------"
    puts row
    puts separator
    puts row
  end
end

