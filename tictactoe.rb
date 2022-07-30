class Player
  attr_reader :name

  def initialize(name, score = 0)
    @name = name
    @score = score
  end
end

class Board 
  attr_reader :board

  @@separator = '-----------'

  def initialize
    @board = Array.new(9, ' ')
  end

  def show
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts @@separator
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts @@separator
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def cross(index)
    board[index] = 'x'
  end

  def nought(index)
    board[index] = 'o'
  end
end

board = Board.new
board.show
board.cross(1)
puts
board.show