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

  def show_options
    puts ' 1 | 2 | 3 '
    puts @@separator
    puts ' 4 | 5 | 6 '
    puts @@separator
    puts ' 7 | 8 | 9 '
    puts
  end

  def show
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts @@separator
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts @@separator
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts
  end

  def cross(index)
    board[index] = 'x'
  end

  def nought(index)
    board[index] = 'o'
  end
end

def greetings
  puts 'Welcome to the game of Tic Tac Toe (Noughts and Crosses)'
  puts '|___|___|___|___|___|___|___|___|___|___|___|___'
  puts '_---_---_---_---_---_---_---_---_---_---_---__--'
  puts '________________________________________________'
  puts '______________________RULES_____________________'
  puts 'The game is designed for two players. The first player plays crosses.'
  puts 'The second player has noughts to distribute across the board.'
  puts 'The board\'s size is fixed 3x3'
  puts 'Player 1 (Crosses), introduce yourself: '
  player1_name = gets.chomp
  player1 = Player.new(player1_name)
  puts "Okay, #{player1_name}, who's to challenge you?"
  player2_name = gets.chomp
  player2 = Player.new(player2_name)
  puts "Alright, #{player2_name}, we're ready to roll."
end

def play_tic_tac_toe 
  greetings
  board = Board.new
end

play_tic_tac_toe