# def player_name(title, health)
#     "#{title} has #{health} health."
# end

# puts player_name("larry", 60)
# puts player_name("curly".upcase, 125)
# puts player_name("moe", 100).capitalize.center(35, '*')
# puts player_name("shemp", 90).capitalize


def time 
    current_time = Time.new
    current_time.strftime("%I:%M:%S")
end

def welcome(player_name, health = 100)
    "I'm #{player_name.capitalize} with a health of #{health} as of #{time}."
end

puts welcome("larry", 60)
puts welcome("curly", 125)
puts welcome("moe")
puts welcome("shemp", 90)