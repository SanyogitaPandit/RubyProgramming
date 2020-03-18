require './game.rb'

puts "\n            ----------- Hangman -------------\n"
puts "\n1. New Game\n"
puts "\n2. Load Game\n"
puts "\nEnter your choise: \n"
choise = gets.chomp.to_i

puts "\nType \"save\" to save the current session at any time.\n"
case choise
when 1
  puts "\n.......... New game started .........\n"
  newGame = Game.new
  newGame.play()
when 2
  begin
  gameData = File.open('saved_games.txt', 'r')
  rescue StandardError => msg 
    puts "exception occured! #{msg}"
  else
    lines = gameData.readlines
    if lines.length == 0
      puts "There are no saved games yet!"
    else
      lines.each_with_index do |line, index|
        words = line.split(",")
        puts "#{index + 1}. #{words[1]} #{words[2]} #{words[3]}"
      end
      gameData.close
      
        puts "\n Enter number to open respective game: "
        no = gets.chomp.to_i
        newGame = Game.new(lines[no-1])
        newGame.play()      
      
    end
  end
end