require './position.rb'

class Rook
  attr_accessor :pieceNum, :code, :color, :pos
  
  def initialize(num = 0, color = false)
    @pieceNum = num
    @color = color
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265C" : @code = "\u2656"
  end
  
  def setposition newPos = nil
    if newPos == nil
      @pos.x = @color == false ? 7 : 0
      @pos.y = @pieceNum == 0 ? 0 : 7      
    elsif validMove?(newPos)
      @pos = newPos
      return true
    end
    return false
  end

  def validMove? newPos

    unless newPos.valid?
      return false
    end

    return true if (newPos.x == @pos.x) || (newPos.y == @pos.y)

    return false
  end
end