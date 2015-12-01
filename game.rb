
#require relevant class files
require './player'
require './board'

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    #start new game
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
    Player.set_mark_and_turn(@player1, @player2)
  end 

  def start
    if @player1.turn == true
      puts "Player 1 rolled a #{player1.roll} and Player 2 rolled a #{player2.roll}."
      puts "Player 1 will go first and have mark 'X'."
      puts "Player 2 will go second and have mark 'O'."
    else
      puts "Player 1 rolled a #{player1.roll} and Player 2 rolled a #{player2.roll}."
      puts "Player 2 will go first and have mark 'X'."
      puts "Player 1 will go second and have mark 'O'."
    end
  end

  def play
    if @player1.turn == true
      current_player = @player1
      name = "Player 1"
    else
      current_player = @player2
      name = "Player 2"
    end
    puts "#{name}, it is your turn."
    puts "#{board}"
    puts "Please choose which row to add your mark: "
    row = gets.chomp
    puts "Please choose which column to add your mark: "
    col = gets.chomp
    row = row.to_i - 1
    col = col.to_i - 1
    if board.values[row][col] == "_"
      board.values[row][col] = current_player.mark
      Player.switch_turn(@player1, @player2)
      if self.board.win?
        puts ""
        puts ""
        puts "Winner!"
        puts name
        puts ""
        puts "#{board}"
      elsif self.board.full?
        puts "CATS! (tie)"
        puts "#{board}"
      else
        self.play
      end
    else
      puts ""
      puts "That square already has a mark. Please try again."
      self.play
    end
  end
end #game