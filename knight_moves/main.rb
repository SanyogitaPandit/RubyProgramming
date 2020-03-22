require "./knight_moves.rb"

puts "\n---------------------------- Knight Moves ---------------------------------"
puts "\nStart and end position (row X col) of knight : "
#input = gets.chomp.split().map(&:to_i)
input = Array.new(4){rand(0..7)}
print "#{input[0..1]}, #{input[2..3]}"
board = Board.new
board.knight_moves(KnightPos.new(input[0], input[1]), KnightPos.new(input[2], input[3]))