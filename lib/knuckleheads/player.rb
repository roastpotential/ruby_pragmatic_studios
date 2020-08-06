require_relative 'game'
require_relative 'die'
require_relative 'treasure_trove'
require_relative 'playable'

module KnuckleheadsGame

    class Player
        attr_accessor :name
        attr_reader :health

        include Playable

        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
            @point_score = 0
        end

        def self.from_csv(line)
            name, health = line.split(',')
            player = KnuckleheadsGame::Player.new(name, Integer(health))
        end

        def to_csv
            "#{@name},#{@health}"
        end

        def load_players(from_file)
            File.readlines(from_file).each do |line|
                add_player(KnuckleheadsGame::Player.from_csv(line))
            end
        end

        def found_treasures(treasure)
            @found_treasures[treasure.name] += treasure.points

            @point_score += treasure.points

            puts "#{@name} found a #{treasure.name}! It is worth #{treasure.points}."
            puts "#{@name}'s current treasures are: #{@found_treasures}."
        end

        def each_found_treasure
            @found_treasures.each do |name, points|
                yield KnuckleheadsGame::Treasure.new(name, points)
            end
        end

        def points
            @found_treasures.values.reduce(0, :+)
        end

        def score
            @health + @point_score
        end

        def point_score
            @score + points
        end


        def <=>(other)
            other.score <=> score 
        end

        def to_s 
            # say_hello changed to to_s
            "I'm #{@name} with a health of #{@health}; my score is #{score}, and my treasure value is #{@point_score}.\n\t"
        end

    end
end