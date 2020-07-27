require_relative 's_s_f_game.rb'

players_list = []

class Player
    attr_accessor :name
    attr_reader :health

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def score
        @health + @name.length
    end

    def to_s
        "Hello! I'm #{@name} with a health pool of #{@health}, and an overall score of #{score}."
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end
    
    def w00t
        @health += 10
        puts "#{@name} got w00ted!"
    end
end

if __FILE__ == $0
    players_list.each do |player|
        puts "*  *  *  *  *"
        puts player
        player.blam
        puts player
        player.w00t
        player.w00t
        puts player
        puts "*  *  *"
    end
end