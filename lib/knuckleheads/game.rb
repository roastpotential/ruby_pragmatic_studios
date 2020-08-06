require_relative 'player'
require_relative 'die'
require_relative 'game_turn_module'
require_relative 'treasure_trove'

module KnuckleheadsGame

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

        def load_players(from_file)
            File.readlines(from_file).each do |line|
                # name, health = line.split(',')
                # player = Player.new(name, Integer(health))
                add_player(KnuckleheadsGame::Player.from_csv(line))
            end
        end

        def high_score_entry(player)
            formatted_name = player.name.ljust(15, '-')
            puts "\n\t#{formatted_name} #{player.score}"
        end

        def save(to_file="players.csv")
            File.open(to_file, "w") do |file|
                @players.sort.each do |player|
                    file.puts player.to_csv
                end
            end
        end

        def save_high_scores(to_file="high_scores.txt")
            File.open(to_file, "w") do |file|
                file.puts "#{title}'s High Scores:"
                @players.sort.each do |player|
                    file.puts high_score_entry(player)
                end
            end
        end
        
        def play(rounds)
            puts "\n\tThere are #{@players.size} players in the game."

            treasures = KnuckleheadsGame::TreasureTrove::TREASURES
            puts"\nThere are #{treasures.size} treasures to be found in the game. Good luck!"
            treasures.each do |treasure|
                puts "\n\tA #{treasure.name} is worth #{treasure.points} points."
            end
            
            puts "\n- - -"
            
            @players.each do |player|
                puts "\n#{player}"
            end

            puts "- - -"

            1.upto(rounds) do |round|
                puts "\nRound #{round}: "
            
                @players.each do |player|  
                    KnuckleheadsGame::GameTurn.take_turn(player)
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

            @players.sort.each do |player|
                puts "\n#{player.name}'s Treasure Haul:"
                formatted_name = player.name
                player.each_found_treasure do |treasure|
                    puts "\t#{treasure.name}: #{treasure.points}"
                end
            end

            puts "\nKnuckleheads's High Scores: "
            @players.sort.each do |player|
                # puts high_score_entry(player)
                # formatted_name = player.name.ljust(15, '-')
                # puts "\t#{formatted_name} #{player.score}"
            end

        end

    end
end