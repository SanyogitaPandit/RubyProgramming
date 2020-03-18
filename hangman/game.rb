class Game
  ATTEMPTS = 15
  attr_accessor :output, :guessLetters, :secretWord, :rounds  
  
  def initialize(gameData = "")
    
    if gameData.casecmp("") == 0      
      @guessLetters = Array.new
      @secretWord = get_word()
      @rounds = ATTEMPTS
      @output = Array.new
      @secretWord.length.times { @output.push("_") }
    else
      words = gameData.split(",")    
      @secretWord = words[0]
      @output = words[1].split(//)    
      @rounds = words[2].to_i
      @guessLetters = words[3].split(//)
    end
  end
  
  def saveToFile
    begin
      gameData = File.open('saved_games.txt', 'a')
    rescue StandardError => msg
      puts "exception occured! #{msg}"
    else
      gameData.puts "#{@secretWord},#{@output.join()},#{@rounds},#{@guessLetters.join()}"
      gameData.close
      puts "\nThe current session is saved!"
    end
  end
  
  #select a word between 5 and 12 characters long for the secret word
  def get_word
    random_word = ""
    open("5desk.txt") do |dictionary|
      words = dictionary.readlines
      until random_word.length.between?(5, 12)
        random_word = words[Random.rand(0...words.length)].chomp
      end
    end
    random_word
  end
  
  def user_input
    
    while true
      puts "\nEnter a letter or save the session: "
      guess = gets.chomp
      if guess.casecmp("save") == 0
        saveToFile()
        puts "Would you like to exit the game (y/n)? "
        if gets.chomp.casecmp("y") == 0
          exit
        else
          next
        end
      elsif (@guessLetters.include? guess) || (@output.include? guess)
        puts "\nThat letter is already taken!"
      elsif (guess.match? /[A-Za-z]/) && guess.length == 1
        break
      else
        puts "\nInvalid Input!"  
      end
    end
    
    return guess
  end
  
  def play  
    itr = @rounds
    itr.times { |rnt|
      puts "\nGuess counts remaining: #{@rounds -= rnt}"
      print "Your guesses: #{@guessLetters.join(" ")}\n"
      print "Secret word: #{@output.join(" ")}\n"
      
      guess = user_input()
    
      letterFound = false
      @secretWord.split("").each_with_index do |letter, index|  
        if letter.casecmp(guess) == 0
          @output[index] = letter
          letterFound = true
        end
      end
    
      unless letterFound
        @guessLetters.push(guess)
      end
      
      if @secretWord.casecmp(@output.join()) == 0
        break
      end
    }
    
    if @secretWord.casecmp(@output.join()) == 0
      puts "You Won!"
    else
      puts "You lost!"
    end
  end
end