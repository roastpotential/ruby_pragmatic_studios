require_relative 's_s_f_player'
require_relative 's_s_f_game'

player1 = Player.new("larry", 60)
player2 = Player.new("curly", 125)
player3 = Player.new("moe")

# players_list = [player1, player2, player3]

# if __FILE__ == $0
#     players_list.each do |player|
#         puts "*  *  *  *  *"
#         puts player
#         player.blam
#         puts player
#         player.w00t
#         player.w00t
#         puts player
#         puts "*  *  *"
#     end
# end

# if __FILE__ == $0
#     game = Game.new("#{@Knuckleheads}")
# end

knuckleheads = Game.new("Knuckleheads")

puts knuckleheads.title

knuckleheads.add_players(player1)
knuckleheads.add_players(player2)
knuckleheads.add_players(player3)

knuckleheads.play()