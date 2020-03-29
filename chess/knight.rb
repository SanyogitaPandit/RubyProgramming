require './position.rb'

class Knight
  attr_accessor :pieceNum, :code, :color, :pos
  
  def initialize(num = 0, color = false)
    @color = color
    @pieceNum = num
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265E" : @code = "\u2658"
  end
  
  def setposition newPos = nil
    if newPos == nil
      @pos.x = @color == false ? 7 : 0
      @pos.y = @pieceNum == 0 ? 1 : 6      
    elsif validMove?(newPos)
      @pos = newPos
      return true
    end
  end

  def validMove? newPos

    unless newPos.valid?
      return false
    end  

    allPosiibleMoves = []
    allPosiibleMoves.push(Position.new(@pos.x - 2, @pos.y - 1))
    allPosiibleMoves.push(Position.new(@pos.x - 2, @pos.y + 1))
    allPosiibleMoves.push(Position.new(@pos.x + 2, @pos.y - 1))
    allPosiibleMoves.push(Position.new(@pos.x + 2, @pos.y + 1))
    allPosiibleMoves.push(Position.new(@pos.x - 1, @pos.y - 2))
    allPosiibleMoves.push(Position.new(@pos.x - 1, @pos.y + 2))
    allPosiibleMoves.push(Position.new(@pos.x + 1, @pos.y - 2))    
    allPosiibleMoves.push(Position.new(@pos.x + 1, @pos.y + 2))

    allPosiibleMoves.reject! { |val| !val.valid? }

    return allPosiibleMoves.include?(newPos)
  end
end