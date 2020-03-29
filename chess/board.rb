require './king.rb'
require './queen.rb'
require './bishop.rb'
require './rook.rb'
require './knight.rb'
require './pawn.rb'

class Board
  attr_accessor :grid, :whiteSet, :blackSet  
  
  def initialize (wset, bset)
    @grid = Array.new(8) { Array.new(8, ".") }
    #get black pieces and place on board    
    @blackSet = bset
    @blackSet.each{ |chessMan| placePiece(chessMan) }
    #get white pieces and place on board
    @whiteSet = wset
    @whiteSet.each{ |chessMan| placePiece(chessMan) }    
  end
  
  def placePiece (piece, oldPos = nil)    
    @grid[oldPos.x][oldPos.y] = "." unless oldPos.nil?
    @grid[piece.pos.x][piece.pos.y] = piece
  end  
  
  def display
    print "\n      R/C"
    8.times { |i| print "    #{i}"}
    print "\n"
    @grid.each_with_index do |row, i|
      print "\n\t#{i}    "
      row.each do |col|
        if col == "."
          print "#{col}    "
        else
          print "#{col.code.encode("UTF-8")}    "
        end
      end
      print "\n"
    end
    puts "\n"
  end

  def validate(player, oldPos, newPos)
    if !oldPos.valid? ||
       !player.chessmen.include?(@grid[oldPos.x][oldPos.y])
        puts "Invalid original position!"
        return false
    elsif !newPos.valid? ||
          player.chessmen.include?(@grid[newPos.x][newPos.y]) ||
          !movePiece(@grid[oldPos.x][oldPos.y], newPos)
        puts "That was invalid move!"
        return false
    else
        return true
    end   
  end

  def movePiece (piece, newPos)
    case piece
    when King
      return piece.setposition(newPos)
    when Queen
      if piece.validMove?(newPos)
        return piece.setposition(newPos) if (validStraightMove?(piece.pos, newPos) || validDiagonalMove?(piece.pos, newPos))
      end
    when Rook
      if piece.validMove?(newPos)
        return piece.setposition(newPos) if validStraightMove?(piece.pos, newPos)
      end
    when Bishop
      if piece.validMove?(newPos)
        return piece.setposition(newPos) if validDiagonalMove?(piece.pos, newPos)
      end      
    when Knight
      return piece.setposition(newPos)
    when Pawn
      return piece.setposition(newPos, @grid[newPos.x][newPos.y] != ".")
    end
    
    return false   
  end

  def validDiagonalMove?(oldPos, newPos)
    return false if (newPos.y == oldPos.y) || (newPos.y == oldPos.y)

    ((newPos.x - oldPos.x).abs - 1).times do |counter|
      counter += 1
      x = newPos.x < oldPos.x ? (oldPos.x - counter) : (oldPos.x + counter)
      y = newPos.y < oldPos.y ? (oldPos.y - counter) : (oldPos.y + counter)

      if @grid[x][y] != "."        
        return false
      end
    end
    return true
  end

  def validStraightMove?(oldPos, newPos)
    x = y = -1
    piecesBetweenTwo = (newPos.x != oldPos.x) ? ((newPos.x - oldPos.x).abs - 1) : ((newPos.y - oldPos.y).abs - 1)
    piecesBetweenTwo.times do |counter|
      counter += 1
      if(newPos.y == oldPos.y)          
        x = newPos.x < oldPos.x ? (oldPos.x - counter) : (oldPos.x + counter)
        y = newPos.y
      elsif (newPos.x == oldPos.x)
        x = newPos.x
        y = newPos.y < oldPos.y ? (oldPos.y - counter) : (oldPos.y + counter)
      end
      if (x == -1) || (@grid[x][y] != ".")
        return false
      end
    end
    return true      
  end
end