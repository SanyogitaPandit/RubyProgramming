require './king.rb'
require './queen.rb'
require './bishop.rb'
require './rook.rb'
require './knight.rb'
require './pawn.rb'

class Player
    attr_accessor :name, :chessmen, :isWhite

    def initialize(name, iswhite = false)        
        @name = name
        @isWhite = iswhite
        @chessmen = Array.new 
        @chessmen = getPieces()        
    end

    def getPieces
        if @chessmen.empty?          
          pieces = ["King","Queen","Rook","Bishop","Knight","Pawn"]
          pieces.each do |piece|
            case piece
              when "King"
                @chessmen.push(King.new(@isWhite))
              when "Queen"
                @chessmen.push(Queen.new(@isWhite))
              when "Rook"
                2.times{ |num| @chessmen.push(Rook.new(num, @isWhite)) }
              when "Bishop"
                2.times{ |num| @chessmen.push(Bishop.new(num, @isWhite)) }
              when "Knight"
                2.times{ |num| @chessmen.push(Knight.new(num, @isWhite)) }
              when
                8.times{ |num| @chessmen.push(Pawn.new(num, @isWhite)) }        
            end
          end
        end

        @chessmen
    end
end