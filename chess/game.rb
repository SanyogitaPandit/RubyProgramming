require "./board.rb"
require "./player.rb"
require "./position.rb"
require "yaml"

class Game
    attr_accessor :board, :player1, :player2, :fileNo, :turn
    def initialize
        @fileNo = Dir['./saved_games/**/*'].count { |file| File.file?(file) }
        @board = nil
        @player1 = nil
        @player2 = nil
        @turn = 0
        displayInstructions()       
    end

    def start
      while true
        puts "\n1. New game"
        puts "\n2. Load game from file"
        puts "Enter your choise:"
        input = gets.chomp
        if input.to_i == 1
            startNewGame()
        elsif input.to_i == 2
            loadGame()
        elsif input.casecmp("save") == 0
            puts "Nothing to save!"
        else
            puts exit
        end
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
        while @player1.nil?
            puts "\nEnter player1's name: "
            name = gets.chomp
            if(name.casecmp("save") == 0)
                puts "Nothing to save!"
            else
                @player1 = Player.new(name, true)
            end                     
        end

        while @player2.nil?
            puts "\nEnter player2's name: "
            name = gets.chomp
            if(name.casecmp("save") == 0)
                saveGame()
            else
                @player2 = Player.new(name)
            end
        end
        
        @board = Board.new(@player1.chessmen, @player2.chessmen)            
        while true
            board.display()
            @turn += 1
            @turn % 2 == 0 ? processInput(@player2) : processInput(@player1)            
        end
    end
    
    def processInput(player)
        puts "#{player.name}'s turn(#{player.isWhite ? 'White' : 'Black'} Pieces): "    
        oldPos = nil
        newPos = nil
        while true
            puts "Please enter your move: "
            input = gets.chomp
            if(input.casecmp("save") == 0)
                saveGame()
            else
                input = input.split().map(&:to_i)    
                oldPos = Position.new(input[0], input[1])
                newPos = Position.new(input[2], input[3])
                
                if board.validate(player, oldPos, newPos)        
                    break
                end
            end
        end

        @board.placePiece(@board.grid[oldPos.x][oldPos.y], oldPos)
    end

    def loadGame
        savedGames = Dir[ './saved_games/chess*.txt' ].select{ |f| File.file? f }.map{ |f| File.basename f }
        savedGames.each_with_index{ |name, i| puts "#{i}. #{name}"}
        puts "Enter your choise from the above saved games:"
        @fileNo = gets.chomp.to_i         
        load_hash = Hash.new        
        load_hash = YAML::load(File.read("./saved_games/#{savedGames[@fileNo]}"))

        @turn = load_hash[:turn]
        @player1 = load_hash[:player1]
        @player2 = load_hash[:player2]

        startNewGame()        
    end

    def saveGame
        Dir.mkdir("saved_games") unless Dir.exists?("saved_games")
        filename = "saved_games/chess#{@fileNo}.txt"
        hash = Hash.new
        hash[:turn] = @turn - 1
        hash[:player1] = @player1
        hash[:player2] = @player2
        File.open(filename,'w') do |file|
            file.write hash.to_yaml      
            file.close()
            puts "Game Saved!"
        end                
    end
end