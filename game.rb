require_relative 'player'
require_relative 'die'
require_relative 'game_turn_module'
require_relative 'treasure_trove'

class Game
    attr_reader :title
    attr_accessor :players

    def initialize(title="Knuckleheads")
        @title = title.capitalize.center(30, '*')
        @players = []
    end

    def add_player(a_player)
        @players << a_player
    end
    
    def play(rounds)
        puts "\n\tThere are #{@players.size} players in the game."

        treasures = TreasureTrove::TREASURES
        puts"\nThere are #{treasures.size} treasures to be found in the game. Good luck!"
        treasures.each do |treasure|
            puts "\n\tA #{treasure.name} is worth #{treasure.value} points."
        end
        
        puts "\n- - -"
        
        @players.each do |player|
            puts "\n#{player}"
        end

        puts "- - -"

        1.upto(rounds) do |round|
            puts "\nRound #{round}: "
        
            @players.each do |player|  
                GameTurn.take_turn(player)
                puts player
            end
        end
    end

    def print_name_and_health(player)
        puts "\t#{player.name} (#{player.health})"
    end

    def print_stats
        strong_players = @players.select{ |player| player.strong? }
        wimpy_players = @players.reject{ |player| player.strong? }

        puts "\nKnuckleheads's Statistics: "

        puts "\n#{strong_players.size} strong player(s): "
        strong_players.each do |player|
            print_name_and_health(player)
        end

        puts "\n#{wimpy_players.size} wimpy player(s): "
        wimpy_players.each do |player|
            print_name_and_health(player)
        end

        # sorted_players = @players.sort { |a, b| b.score <=> a.score }

        puts "\nKnuckleheads's High Scores: "
        @players.sort.each do |player|
            formatted_name = player.name.ljust(15, '-')
            puts "\t#{formatted_name} #{player.score}"
        end
    end
end