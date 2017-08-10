class Validate

attr_reader :type, :input

def initialize
  @type = type
  @input = input
end

def valid_game_selection?(type)
  if (0..2).include?(type)
    true
  else
    puts "You did not enter a 0, 1, or 2.  Please try again."
    puts "Would you like to play a 0, 1 or 2 player game?"
      type = gets.chomp
      select_game(type)
    end
end

def valid_selection?(input)
  if input != "Y" || input != "N"
    puts "That is not a valid choice."
  end
end

end
