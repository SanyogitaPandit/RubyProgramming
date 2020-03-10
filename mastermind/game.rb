require 'colorize'

class Game
  attr_accessor :colorset, :code  
  
  def initialize(gameChoise)
    @code = Array.new
    @guessAndFeedback = Hash.new
    @colorset = ["Red".red,
                 "Cyan".cyan,
                 "Yellow".yellow,
                 "Green".green,
                 "Blue".blue,
                 "Magenta".magenta]
    
    case gameChoise
    when 1
      codebreaker()
    when 2
      puts "Coming soon!"
    when 3
      puts "Coming soon!"
    end
  end
  
  def codebreaker
    setCode()
    puts "\n Four pegs color code is set. [****]"
    puts @code
    winner = false
    
    12.times { |round|
      displayColors()
      puts "\nRound #{round += 1}:"
      guessCode = []
      4.times {
        puts "\nGuess color number for position #{guessCode.length()+1}: "
        input = gets.chomp.to_i
        while input == 0 || input > 6       
          puts "\nInvalid input.\n"
          input = gets.chomp.to_i
        end
        guessCode.push(@colorset[input-1])
      }
      @guessAndFeedback[guessCode] = verify(guessCode)
     
      if displayResult()
        winner = true
        break
      end
    }
    
    if winner
      puts "You Won!"   
    else
      puts "You Lost!"
    end
  end
  
  def displayResult  
    puts "\n Your guesses with respective feedbacks:"
    @guessAndFeedback.each_with_index do |(data1, data2), ind|
      print "\n #{ind + 1}:"
      data1.each { |col| print " #{col}"}
      print "::"
      data2.each { |col| print " #{col}"}
      print "\n"
      if @code == data1
        return true
      end
    end
    return false
  end
  
  def verify(guess)
    userGuess = guess.clone
    feedback = ["_", "_", "_", "_"]
    feedbackInd = -1;
    wrongPos = {}
    
    @code.each_with_index do |color, index|
      
      4.times { |ind|
        if color == userGuess[ind] && index == ind
          feedback[feedbackInd += 1] = "Black"
          userGuess[ind] = "_"
          wrongPos[color] = false
          break
        elsif color == userGuess[ind] && wrongPos[color] == nil
          wrongPos[color] = true
        end
      }
      
      if wrongPos[color]
        feedback[feedbackInd += 1] = "White"
        wrongPos[color] = false
      end
    end

    return feedback
  end
    
  def setCode
    4.times {
      index = rand(0..5)
      @code.push(@colorset[index])      
    }
  end
  
  def displayColors
    print "\nThe colorset is:\n"
    @colorset.each_with_index do |color, index|
      puts "#{index + 1}: #{color}"
    end
    print "\n"
  end
end