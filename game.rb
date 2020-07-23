require_relative 'player'

class Game
    attr_reader :title

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
            puts player
            puts player.blam
            puts player.w00t
            puts player.w00t
            puts "- - -"
        end
    end
end