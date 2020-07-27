player1 = 'larry'
health1 = 60

player2 = 'curly'
health2 = 125
player2 = player2.upcase

player3 = 'moe'
health3 = 100
title1 = player3.capitalize

player4 = 'shemp'
health4 = 90
title2 = player4.capitalize.ljust(35, '.')

puts "#{player1} has a health of #{health1}."

puts "#{player2} has a health of #{health2}."

puts "#{title1} has a health of #{health3}.".center(55, '*')

puts "#{title2} #{health4} health"