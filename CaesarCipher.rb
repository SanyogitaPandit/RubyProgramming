def Caesar_Cipher(string, shiftFactor)
	upCase = ('A'..'Z').to_a
	downCase = ('a'..'z').to_a
	
	encrypted = ""
          
        string.chars.map do |char|
            if(upCase.include?(char))
                encrypted += (((char.ord + shiftFactor - 65) % 26 ) + 65).chr
            elsif(downCase.include?(char))
                encrypted += (((char.ord + shiftFactor - 97) % 26) + 97).chr
            else
                encrypted += char
            end            
        end 
        
	encrypted
end

puts("Enter the string: ")
str = gets.chomp
puts("Enter the shift factor: ")
no = gets.chomp.to_i

puts Caesar_Cipher(str, no)