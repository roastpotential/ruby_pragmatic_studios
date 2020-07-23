require_relative 'game'
require_relative 'die'

class Player
    attr_accessor :name
    attr_reader :health

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def to_s 
        # say_hello changed to to_s
        "I'm #{@name} with a health of #{@health}; my score is #{score}.\n\t"
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end
    
    def w00t
        @health += 15
        puts "#{@name} got w00ted!"
    end

    def score
        @health + @name.length
    end

    def strong?
        @health > 100
    end
end