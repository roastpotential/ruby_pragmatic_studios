require_relative 'player'
require_relative 'die'
require_relative 'game_turn_module'

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
            GameTurn.take_turn(player)
            puts player
        end
    end
end