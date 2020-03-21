require './bst.rb'

puts "\n---------  Binary Search Tree  -------------"
while true
  puts "\nEnter array of numbers separated by space or ctrl+c to exit:\n"
  arr = Array.new(15){rand(1..100)} #gets.chomp.split()
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
      when 3
        puts "\nEnter number to be found: "
        num = gets.chomp.to_i
        puts bst.find(num)
        bst.show()
      when 4
        puts "\nLevel Order: "        
        bst.level_order do |node|
           puts node
        end
        
        print bst.level_order
      when 5
        puts "\nInOrder: "        
        bst.inorder do |node|
           puts node
        end
        
        print bst.inorder
      when 6
        puts "\nPre Order: "        
        bst.preorder do |node|
           puts node
        end
        
        print bst.preorder
      when 7
        puts "\nPost Order: "        
        bst.postorder do |node|
           puts node
        end
        
        print bst.postorder
      when 8 
        puts "\nEnter the num: "
        node = bst.find(gets.chomp.to_i)
        puts "Depth: #{bst.depth(node)}"
      when 9
        puts "Is balanced : #{bst.balanced?}"
      when 10
        bst.rebalance!
        bst.show()
      else
        exit
      end
    end
end