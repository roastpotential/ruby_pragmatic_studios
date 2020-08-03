require_relative 'player'
require_relative 'treasure_trove'

class ClumsyPlayer < Player

    if __FILE__ == $0
        clumsy = ClumsyPlayer.new("klutz")

        # potion = Treasure.new(:potion, 50)
        # clumsy.found_treasures(potion)
        # clumsy.found_treasures(potion)
        # clumsy.found_treasures(potion)

        strange_weapon = Treasure.new(:strange_weapon, 200.0)
        clumsy.found_treasures(strange_weapon)
        clumsy.found_treasures(strange_weapon)

        clumsy.each_found_treasure do |treasure|
            puts "#{@treasure.points} total #{@treasure.name} points."
        end

        puts "#{clumsy.points}'s Grand Total Points:"
    end

    def found_treasures(treasure)
        damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
        super(damaged_treasure)
        # @point_score += treasure.points / 2.0
        # @found_treasures[treasure.name] += treasure.points
        # puts "#{@name} found a #{treasure.name} worth #{points}." 
    end

end