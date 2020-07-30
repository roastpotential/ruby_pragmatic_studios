require_relative 'player'
require_relative 'die'
require_relative 'game'

module GameTurn
    def self.take_turn(player)
        die = Die.new   

        number_rolled = die.roll
        
        case die.roll
        when 1..2
            player.blam
        when 3..4
            puts "#{player.name} was skipped"
        else
            player.w00t
        end

        treasure = TreasureTrove.random
        player.found_treasures(treasure)
        # puts "#{player.name} found a #{treasure.name}! It is worth #{treasure.points}."
        # puts "#{player.name}'s current treasures are: #{@found_treasures}."
    end
end