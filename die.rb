require_relative 'game'
require_relative 'player'

class Die
  attr_reader :number
  
  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
  end

# if __FILE__ == $0
#   die = Die.new
#   puts die.roll
#   puts die.roll
#   puts die.roll
end