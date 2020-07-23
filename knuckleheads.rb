require_relative 'game'
require_relative 'player'
require_relative 'game_turn_module'

players = []

knuckleheads = Game.new("Knuckleheads")

puts knuckleheads.title

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
# player2.name = "Lawrence"
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

players = [player1, player2, player3, player4]

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)

knuckleheads.play

# players.each do |player|
#     puts player.health
# end

# players.each do |player|
#     puts player
#     puts player.blam
#     puts player.w00t
#     puts player.w00t
#     puts player
#     puts "- - -"
# end

# puts "- - -\n\t"
# puts player3.blam
# puts player3.blam
# puts player3.blam
# puts player3
# puts player3.w00t
# puts player3

# def say_hello(name, health=100)
#     puts "I'm #{name.capitalize} with a health of #{health} as of #{time}!"
# end

# def time
#     current_time = Time.new
#     current_time.strftime("%I:%M:%S")
# end

# say_hello("larry", 60)
# say_hello("curly", 125)
# say_hello("moe")
# say_hello("shemp", 90)


# # # name1 = 'larry'
# # # health1 = 60
# # # puts name1 + '\'s' + ' health is ' + health1.to_s

# # # name2 = 'curly'
# # # name3 = 'moe'

# # # puts "#{name1}'s health is #{health1}."
# # # puts "#{name1}'s health is #{health1 * 3}."

# # # puts "#{name1}'s health is #{health1 / 9.0}."
# # # puts "#{name1}'s health is #{health1 / 9}."

# # # puts "Players: \n\tlarry\n\tcurly\n\tmoe"

# # # puts "Players: \n\t#{name1}\n\t#{name2}\n\t#{name3}"

# # name1 = 'larry'
# # health1 = 60

# # name2 = 'curly'
# # health2 = 125

# # name3 = 'moe'
# # health3 = 100

# # name4 = 'shemp'
# # health4 = 90

# # health2 = health1
# # health1 = 30

# # puts "#{name1.capitalize}'s health is #{health1}."
# # puts "#{name2.upcase}'s health is #{health2}."
# # puts "#{name3}'s health is #{health3}.".center(50, '*')
# # puts "#{name4.capitalize.ljust(30, '.')} #{health4}"