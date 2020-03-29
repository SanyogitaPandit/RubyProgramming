require "./board.rb"
require "./player.rb"
require "./position.rb"

class Game
    attr_accessor :board, :player1, :player2
    def initialize
        @board = nil
        @player1 = nil
        @player2 = nil
        displayInstructions()       
    end

    def start
        puts "\n1. New game"
        puts "\n2. Load game from file"
        puts "Enter your choise:"
        if gets.chomp.to_i == 1
            startNewGame()
        else
            loadGame()
        end        
    end

    def displayInstructions
        puts "\n---------------------------- CHESS ---------------------------------\n"        
        puts "\nType ctrl+c at any time to exit the game."
        puts "\nType save at any time to save the game."
        puts "\nTo move a piece enter its original position and target position."
        puts "e.g. to move knight type> 0 1 2 2 "
        puts "i.e. 0, 1 is original position and 2, 2 is target position"
    end

    def startNewGame

        if @player1.nil?
            puts "\nEnter player1 name: "
            @player1 = Player.new(gets.chomp, true)
        end

        if @player2.nil?
            puts "\nEnter player2 name: "
            @player2 = Player.new(gets.chomp)
        end
        
        @board = Board.new(@player1.chessmen, @player2.chessmen)
        counter = 0      
        while true
            board.display()
            counter += 1
            counter % 2 == 0 ? board.processInput(@player2) : board.processInput(@player1)            
        end
    end    

    def loadGame
    end
end