def fiboIter(no)
  arr = []
  index = 0
  while index <= no
    if index == 0
      arr.push(0)
    elsif index == 1
      arr.push(1)
    else
      arr.push(arr[index-1] + arr[index-2])
    end
    index += 1
  end
  
  return arr
end

#recursive fun for the same
def fiboRec(no)
  if no == 0
    return [0]
  elsif no == 1
    return fiboRec(0).push(1)
  else
    arr = fiboRec(no-1)
    return arr.push(arr[no-1] + arr[no-2])
  end
end

while true
puts "\nEnter a number for fibonacci series (ctrl+c to exit): "
num = gets.chomp.to_i
print fiboIter(num)
puts "\nResult from recursion: "
print fiboRec(num)
end