# def player_name(title, health)
#     "#{title} has #{health} health."
# end

# puts player_name("larry", 60)
# puts player_name("curly".upcase, 125)
# puts player_name("moe", 100).capitalize.center(35, '*')
# puts player_name("shemp", 90).capitalize

# "I'm #{player_name.capitalize} with a health of #{health} as of #{time}."

# to_s is making any object scream whatever you want it to say; instead of "say_hello", it puts it in the make-up of their name like a 2010's dA comment tag

class Player
    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end
    def to_s
        "I'm #{@name} with a health of #{@health}."
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

player1 = Player.new("larry", 60)
player2 = Player.new("curly", 125)
player3 = Player.new("moe")
player4 = Player.new("shemp", 90)

puts player1.inspect
puts player2.inspect
puts player3.inspect
puts player4.inspect

puts player1
puts player2
puts player3
puts player4

puts player3.blam
puts player3
puts player3.w00t
puts player3