def StockPicker arr
	result = [0,0]
	tempArr = Array.new(arr)
		
	#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day
	while tempArr.index(tempArr.max) == 0
		tempArr.delete_at(0)		
	end
		
	while tempArr.index(tempArr.min) == tempArr.size - 1
		tempArr.pop
	end
	
	#Get maximum profit
	i = 0;
	profit = 0
	temp = Array.new(2)
	while i < tempArr.size - 1
		temp[0] = tempArr[i]
		j = i+1
		while j < tempArr.size
			temp[1] = tempArr[j]
			if temp[0] < temp[1]
				tempProfit = temp[1] - temp[0] 
				if tempProfit > profit
					profit = tempProfit
					result[0] = arr.index(temp[0])
					result[1] = arr.index(temp[1])
				end
			end
			
			j += 1
		end
		
		i += 1
	end
	
	result
end

#main
puts("Enter no of days: ")
arrSize = gets.chomp.to_i
puts("Enter the stock prices from day 0: ")

stockPrices = Array.new
i = 0
while i < arrSize
	stockPrices.push(gets.chomp.to_i)
	i += 1
end

StockPicker(stockPrices)