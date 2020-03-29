require 'colorize'
class KnightPos
  attr_accessor :x, :y, :parent
  
  def initialize(x, y, parent = nil)
    @x, @y, @parent = x , y, parent
  end
  
  def valid?
    return ((0..7).include? @x) && ((0..7).include? @y)
  end
  
  def ==(obj)
    return (@x == obj.x) && (@y == obj.y)
  end
  
  def all_possible_moves
    moves = []
    moves.push(KnightPos.new(@x - 2, @y - 1, self))
    moves.push(KnightPos.new(@x - 2, @y + 1, self))
    moves.push(KnightPos.new(@x + 2, @y - 1, self))
    moves.push(KnightPos.new(@x + 2, @y + 1, self))
    moves.push(KnightPos.new(@x - 1, @y - 2, self))
    moves.push(KnightPos.new(@x - 1, @y + 2, self))
    moves.push(KnightPos.new(@x + 1, @y - 2, self))
    moves.push(KnightPos.new(@x + 1, @y + 2, self))
    moves.reject! { |val| !val.valid? }
    return moves
  end
end

class Board
  attr_accessor :grid
  
  def initialize
    @grid =  [[0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0]]
  end
  
  def display
    @grid.each do |row|
      print "\n\t\t"
      row.each do |col|
        print "#{col}    "
      end
      print "\n"
    end
  end
  
  def breadth_first_search(startpos, endpos)
    return nil unless startpos.valid? || endpos.valid?
      
    queue = []  
    queue.push(startpos)
    
    until queue.empty?
      currentPos = queue.shift
      return currentPos if currentPos == endpos
      currentPos.all_possible_moves().each { |pos| queue.push(pos) } 
    end
    
    return nil   
  end
  
  def knight_moves(startpos, endpos)    
    foundPos = breadth_first_search(startpos, endpos) 
    
    path = []
    until foundPos.nil?
      path.unshift(foundPos)
      foundPos = foundPos.parent
    end
    
    path.each_with_index { |pos, i| @grid[pos.x][pos.y] = i.to_s.green }    
    @grid[startpos.x][startpos.y] = "S".red
    @grid[endpos.x][endpos.y] = "E".green
    display()
    puts "\nYou made it in #{path.length()-1} moves as shown on the above board (Path shown by green color).\n"
  end  
end