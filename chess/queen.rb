require './position.rb'

class Queen
  attr_accessor :code, :color, :pos
  
  def initialize(color = false)
    @color = color
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265B" : @code = "\u2655"
  end
  
  def setposition newPos = nil
    if newPos.nil?
      @color == false ? (@pos.x, @pos.y = 7, 3) : (@pos.x, @pos.y = 0, 3)      
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
    return true if (newPos.x - @pos.x).abs == (newPos.y - @pos.y).abs

    return false
  end
end