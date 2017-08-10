class TicTacToeCLI
  attr_accessor :valid

  def initialize
    @valid = Validate.new
  end

  def call
  end_game = false
    until end_game == true do
      puts "Hello and welcome to Tic Tac Toe!"
      game = select_game
      game.board.display
      game.play
      play_again?
    end
  end

  def select_game
    puts "Would you like to play a 0, 1 or 2 player game?"
    type = gets.chomp
    @valid.valid_game_selection?(type)
    case type
      when "0"
        puts "Get ready to sit back and relax while the computer plays against itself."
        game = game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      when "1"
        puts "You chose to play the computer.  Good luck!"
        play_order
      when "2"
        puts "You chose a two player game.  Player 1 will be 'X', Player 2 will be 'O'"
        game = Game.new
    end
  end

  def play_order
    puts "Would you like to go first? Y/N"
    player = gets.strip.upcase
    if player == "Y"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
    elsif player == "N"
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
    end
  end

  def play_again?
    puts "Would you like to play again?  Y/N"
    input = gets.strip.upcase
    if @valid.valid_selection?(input)
      if input == "Y"
        puts "Great!  Time for another round of Tic Tac Toe!"
      else
        puts "Thank you for playing Tic Tac Toe! Come on back now ya hear!"
        end_game= true
        abort
      end
    end
  end

end
