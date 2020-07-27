require_relative 's_s_f_player.rb'
# require_relative 'die'

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
        puts "There are #{@players.size} players in #{@title}: "
       
        @players.each do |player|
          puts player
        end
       
    #     @players.each do |player|
    #       die = Die.new
    #       case die.roll
    #       when 1..2
    #         player.blam
    #       when 3..4
    #         puts "#{player.name} was skipped."
    #       else
    #         player.w00t
    #       end
    #       puts player
    #     end
    #   end

    # def play
    #     puts "There are #{@players.size} players in #{title}."
    #     @players.each do |player|
    #         puts player
    #     end
    # end
end

# if __FILE__ == $0
#     game = Game.new("#{@Knuckleheads}")
# end