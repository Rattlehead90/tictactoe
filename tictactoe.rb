require 'pry-byebug'

class Player
  attr_reader :name, :mark
  attr_accessor :choice

  def initialize(name, mark, score = 0)
    @name = name
    @mark = mark
    @score = score
    @choice = nil
  end

  def make_a_choice(board)
    self.choice = gets.chomp.to_i - 1
    until self.choice.between?(0, 8) && board.board[self.choice] == ' '
      puts "Sorry, #{self.choice + 1} is not on the board... *literally*. Enter the number between 1 and 9 that is not occupied"
      self.choice = gets.chomp.to_i - 1
    end
  end
end

class Board 
  attr_reader :board
  attr_accessor :is_won

  @@separator = '-----------'

  def initialize
    @board = Array.new(9, ' ')
    @is_won = false
  end

  def self.show_options
    puts
    puts
    puts ' 1 | 2 | 3 '
    puts @@separator
    puts ' 4 | 5 | 6 '
    puts @@separator
    puts ' 7 | 8 | 9 '
    puts
  end

  def show
    puts 
    puts
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts @@separator
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts @@separator
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts
  end

  def mark(index, mark)
    board[index] = mark
  end

  def game_is_won?
    winning_combinations = [
      [0, 4, 8], [2, 4, 6], [0, 1, 2],
      [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8]
    ]
    winning_combinations.each do |combination|
      if (  board[combination[0]] != ' ' &&
            board[combination[1]] != ' ' &&
            board[combination[2]] != ' ' &&
            board[combination[0]] == board[combination[1]] && 
            board[combination[1]] == board[combination[2]]  )
        self.is_won = true
      end
    end
    return self.is_won
  end
end

def initialize_game
  puts 
  puts
  puts 'Welcome to the game of Tic Tac Toe (Noughts and Crosses)'
  puts '|___|___|___|___|___|___|___|___|___|___|___|___'
  puts '_---_---_---_---_---_---_---_---_---_---_---__--'
  puts '________________________________________________'
  puts '______________________RULES_____________________'
  puts 'The game is designed for two players. The first player plays crosses.'
  puts 'The second player has noughts to distribute across the board.'
  puts 'The board\'s size is fixed 3x3'
  Board.show_options
  puts 'Player 1 (Crosses), introduce yourself: '
  player1_name = gets.chomp
  player1 = Player.new(player1_name, 'x')
  puts "Okay, #{player1_name}, who's to challenge you?"
  player2_name = gets.chomp
  player2 = Player.new(player2_name, 'o')
  puts "Alright, #{player2_name}, we're ready to roll."
  board = Board.new
  return player1, player2, board
end

def play_tic_tac_toe 
  player1, player2, board = initialize_game
  player_list = [player1, player2]
  turn = 0
  until board.game_is_won?
    player = player_list[turn % 2]
    print "#{player.name}'s turn. Choose the cell to put a cross  or a nought in:"
    Board.show_options
    player.make_a_choice(board)
    board.mark(player.choice, player.mark)
    board.show
    turn += 1
  end
  'game over'
end

play_tic_tac_toe
