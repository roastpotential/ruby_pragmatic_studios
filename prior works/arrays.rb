# # puts player_name("larry", 60)
# # puts player_name("curly".upcase, 125)
# # puts player_name("moe", 100).capitalize.center(35, '*')
# # puts player_name("shemp", 90).capitalize

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

    def to_hello
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

player1 = Player.new("larry", 60)
player1.name = "Lawrence"
player2 = Player.new("curly", 125)
player3 = Player.new("moe")
# player4 = Player.new("shemp", 90)

players_list = [player1, player2, player3]

puts "There are #{players_list.size} players in the game."

players_list.each do |players|
    puts players.name
end

players_list.each do |players|
    puts players.health
end

players_list.pop
player4 = Player.new("shemp", 90)
players_list.push(player4)

players_list.each do |players|
    puts "*  *  *  *  *"
    puts players.to_hello
    players.blam
    players.w00t
    players.w00t
    puts players.to_hello
    
end

# puts player1.to_hello
# puts player2.to_hello
# puts player3.to_hello
# puts player4.to_hello

# # puts player1.inspect
# # puts player2.inspect
# # puts player3.inspect
# # puts player4.inspect

# # puts player3.blam
# # puts player3
# # puts player3.w00t
# # puts player3