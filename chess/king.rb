require './position.rb'

class King
  attr_accessor :code, :color, :pos
  
  def initialize(color = false)
    @color = color
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265A" : @code = "\u2654"
  end
  
  def setposition newPos = nil
    if newPos.nil?
      @color == false ? (@pos.x, @pos.y = 7, 4) : (@pos.x, @pos.y = 0, 4)
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

    allPosiibleMoves = []
    allPosiibleMoves.push(Position.new(@pos.x, @pos.y-1))
    allPosiibleMoves.push(Position.new(@pos.x-1, @pos.y))
    allPosiibleMoves.push(Position.new(@pos.x, @pos.y+1))
    allPosiibleMoves.push(Position.new(@pos.x+1, @pos.y))
    allPosiibleMoves.push(Position.new(@pos.x-1, @pos.y-1))
    allPosiibleMoves.push(Position.new(@pos.x-1, @pos.y+1))
    allPosiibleMoves.push(Position.new(@pos.x+1, @pos.y+1))    
    allPosiibleMoves.push(Position.new(@pos.x+1, @pos.y-1))

    allPosiibleMoves.reject! { |val| !val.valid? }

    return allPosiibleMoves.include?(newPos)
  end
end