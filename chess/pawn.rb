require './position.rb'

class Pawn
  attr_accessor :pieceNum, :code, :color, :pos, :isFirstMove
  
  def initialize(num = 0, color = false)
    @isFirstMove = true
    @pieceNum = num
    @color = color
    @pos = Position.new
    setcode()
    setposition()
  end
  
  def setcode(color = @color)
    color == false ? @code = "\u265F" : @code = "\u2659"
  end
  
  def setposition (newPos = nil, opponentChessPiece = false)
    if newPos == nil
      @pos.x = (@color == false) ? 6 : 1
      @pos.y = @pieceNum    
    elsif(validMove?(newPos, opponentChessPiece))
      @pos = newPos
      @isFirstMove = false
      return true
    end

    return false
  end

  def validMove? (newPos, opponentChessPiece = false)

    unless newPos.valid?
      return false
    end

    if @isFirstMove
      if @color
        return true if (newPos.x == (@pos.x + 2)) && (newPos.y == @pos.y)
      else
        return true if (newPos.x == (@pos.x - 2)) && (newPos.y == @pos.y)
      end
    end

    if opponentChessPiece
      if @color
        return true if (newPos.x == (@pos.x + 1)) && ((newPos.y - @pos.y).abs == 1)
      else
        return true if (newPos.x == (@pos.x - 1)) && ((newPos.y - @pos.y).abs == 1)
      end
    else
      if @color
        return true if (newPos.x == (@pos.x + 1)) && (newPos.y == @pos.y)
      else
        return true if (newPos.x == (@pos.x - 1)) && (newPos.y == @pos.y)
      end
    end    

    return false
  end
end