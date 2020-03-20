require './bst.rb'

puts "\n---------  Binary Search Tree  -------------"
while true
  puts "\nEnter array of numbers separated by space or ctrl+c to exit:\n"
  arr = Array.new(5){rand(1..100)} #gets.chomp.split()
  bst = Tree.new(arr)
  bst.show()
    while true
      puts "\nBinary tree operations:"
      puts "1. Insert"
      puts "2. Delete"
      puts "3. Find"
      puts "4. Level Order"
      puts "5. Inorder"
      puts "6. Preorder"
      puts "7. Postorder"
      puts "8. Depth"
      puts "9. Balanced"
      puts "10. Rebalances"
      
      choise = gets.chomp.to_i
      
      case choise
      when 1
        puts "\nEnter number to be inserted: "
        num = gets.chomp.to_i
        bst.insert(num)
        bst.show()
      when 2
        puts "\nEnter number to be deleted: "
        num = gets.chomp.to_i
        bst.delete(num)
        bst.show()
      else
        exit
      end
    end
end