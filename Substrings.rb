def SubStrings(words, dictionary)
	resHash = Hash.new(0)
	wordsArr = words.downcase.split(" ")
	puts wordsArr
	dictionary.each do |subStr|	
		wordsArr.each{ |word| resHash[subStr] += 1 if word.include?(subStr.downcase) }
	end
	resHash
end

inDictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts("Enter the string: ")
str = gets.chomp

puts SubStrings(str, inDictionary)