require_relative 'game'
require_relative 'player'
require_relative 'game_turn_module'
require_relative 'auditable'

module KnuckleheadsGame

  class Die
    attr_reader :number

    include Auditable
    
    def initialize
      roll
    end

    def roll
      @number = rand(1..6)
      audit
      @number
    end

  # if __FILE__ == $0
  #   die = Die.new
  #   puts die.roll
  #   puts die.roll
  #   puts die.roll
  end
end