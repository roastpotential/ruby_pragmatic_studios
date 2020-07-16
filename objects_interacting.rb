class Game
    attr_reader :title 

    def initialize(title)
        @title = title
        @title = "Knuckleheads"
    end

    # def add_players(players)
    #     @players.push(players)
    # end

    def play
        @players.each do |player|
            puts player
        end
        @players.each do |player|
            player.blam
            player.w00t
            player.w00t
            puts player
        end
    end
end

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

players_list = [player1, player2, player3]

puts "There are #{players_list.size} players in Knuckleheads."

players_list.each do |players|
    puts players.name
end

players_list.each do |players|
    puts players.health
end

players_list.each do |players|
    puts "*  *  *  *  *"
    puts players.to_hello
    puts "//  oof!! //"
    players.blam
    puts players.to_hello
    puts "-- ooh! --"
    players.w00t
    puts players.to_hello
    
end

# knuckleheads = Game.new("Knuckleheads")

# knuckleheads.add_players(player1)
# knuckleheads.add_players(player2)
# knuckleheads.add_players(player3)

# knuckleheads.play