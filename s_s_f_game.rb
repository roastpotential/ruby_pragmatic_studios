require_relative 's_s_f_player'

class Game
    attr_reader :title 

    def initialize(title)
        @title = title
        @players = []
        @title = "Knuckleheads"
    end

    def add_players(players)
        @players.push(players)
    end

    def play
        puts "There are #{@players.size} players in #{title}."
        @players.each do |player|
            puts player
        end
    end
end