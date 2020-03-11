require './game.rb'

while true
  puts "\n\n------------------ Mastermind ---------------------\n\n"
  puts "\n1. AI vs Codebreaker:"
  puts "\n2. AI vs Codemaker:"
  puts "\nPlease enter your choise from above:\n"
  choise = gets.chomp.to_i
  
  case choise
  when 1
    Game.new(1)
  when 2
    Game.new(2)
  else
    break
  end
end