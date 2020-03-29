require './position.rb'

class Bishop
  attr_accessor :pieceNum, :code, :color, :pos
  
  def initialize(num = 0, color = false)
    @pieceNum = num
    @color = color
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265D" : @code = "\u2657"
  end
  
  def setposition(newPos = nil)
    if newPos.nil?
      @pos.x = @color == false ? 7 : 0
      @pos.y = @pieceNum == 0 ? 2 : 5
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

    return true if (newPos.x - @pos.x).abs == (newPos.y - @pos.y).abs

    return false
  end
end