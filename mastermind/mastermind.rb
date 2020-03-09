//require './board.rb'
//require './player.rb'
require './game.rb'


puts "\n\n------------------ Mastermind ---------------------\n\n"

colorset = [r, o, y, g, b, v]

puts "\n1. AI vs Codebreaker:"
puts "\n2. AI vs Codemaker:"
puts "\n3. Codemaker vs Codebreaker:\n"
puts "\nPlease enter your choise from above:\n"
choise = gets.chomp

case choise
when 1
when 2
when 3
else
  break
end