class Board
  attr_accessor :positions

  def initialize()
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winPos = [[1,2,3], [4,5,6], [7,8,9],
               [1,4,7], [2,5,8], [3,6,9],
               [1,5,9],[3,5,7]]
  end

  def show
    count = 0
    @positions.each do |e|
        print " #{e} "
        count+=1
        if count % 3 != 0
          print "|"
        elsif count < @positions.length()
          print "\n-----------\n"
        end
    end
    puts "\n"
  end
  
  def success? inArr
    found = false
    
    if inArr.length() > 2
      @winPos.each do |arr|
        arr.each do |e| 
          unless inArr.include? e 
            found = false
            break
          end
          found = true
        end
      
        if found
          break
        end     
      end
    end

    return found
  end
end

class Game
  def initialize()
    start()
  end
  
  def start()
    puts "\n\n------- Tic-Tac-Toe -------\n\n"
    puts "Enter 1st player's name: "
    player1 = gets.chomp()
    puts "Enter 2nd player's name: "
    player2 = gets.chomp()

    board = Board.new

    player1pos = []
    player2pos = []
    entry = ""
    rounds = 0
    board.show
    gameNotOver = true  
    
    while gameNotOver      
      puts "\nPlease enter your position (1-9) or 'q' to end: "
      entry = gets.chomp
      
      if entry == "q" || entry == "Q"
        break
      end
    
      if !((1..9).to_a.include? entry.to_i)
        puts "\nInvalid input"
      	next        
      end
      
      pos = Integer(entry) - 1
      if board.positions[pos] == "X" || board.positions[pos] == "O"
        puts "\nThis position is taken"
        next
      else
        if rounds % 2 == 0
          board.positions[pos] = "X"
          player1pos.push(pos+1)

          if board.success?(player1pos)
            puts "#{player1} wins"
            gameNotOver = false
          end
        else
          board.positions[pos] = "O"
          player2pos.push(pos+1)

          if board.success?(player2pos)
            puts "#{player2} wins"
            gameNotOver = false
          end            
        end
        
        rounds += 1
        board.show()
      end       
    end
  end
end