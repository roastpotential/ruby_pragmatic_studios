require_relative 'player'
require_relative 'die'

class Game
    attr_reader :title
    attr_accessor :players

    def initialize(title="Knuckleheads")
        @title = title.capitalize
        @players = []
    end

    def add_player(a_player)
        @players << a_player
    end
    
    def play
        puts "\n\tThere are #{@players.size} players in the game."
        
        puts "- - -"
        
        @players.each do |player|
            puts player
        end

        puts "- - -"
        
        @players.each do |player|  
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
            
            puts player
            
            puts "- - -"

          end
    end
end