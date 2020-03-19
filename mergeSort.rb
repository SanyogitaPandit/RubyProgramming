def merge_sort(arr)
  sortedArr = []
  if arr.length() >= 2
    halfLen = arr.length()/2
    arr1 = merge_sort(arr[0...halfLen])
    arr2 = merge_sort(arr[halfLen...arr.length]) 

    until arr1.empty? || arr2.empty?
        if arr1.first > arr2.first
          sortedArr << arr2.shift
        else
          sortedArr << arr1.shift
        end        
    end
    
    sortedArr += arr1 unless arr1.empty?
    sortedArr += arr2 unless arr2.empty?

  else
    sortedArr = arr
  end  
  return sortedArr
end

puts "\n---------  MERGE SORT  -----------"
while true
puts "\nEnter array of numbers separated by space (or ctrl+c to exit):\n"
array = gets.chomp.split()
puts "\nYour array: #{array}"
puts "\nSorted array: #{merge_sort(array)}"
end
