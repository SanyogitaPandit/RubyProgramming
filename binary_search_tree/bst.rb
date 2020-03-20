class Node
  include Comparable
  
  attr_accessor :data, :left, :right
  
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end
  
  def <=>(val)
    if val.is_a? Node
      @data <=> val.data
    else
      @data <=> val
    end
  end
end

class Tree
  attr_accessor :root
  
  def initialize arr
    #sort array and remove duplicates
    arr.sort!.uniq!
    @root = build_tree(arr)
  end
  
  def build_tree(arr)
    if arr.length() < 1
      return nil
    elsif arr.length() == 1
      return Node.new(arr.first)
    end
    
    mid = (arr.length() / 2)
    
    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[(mid + 1)..arr.length()])
    return root
  end
  
  def show(rn = @root)
    print "#{rn.data} "
    print "Le:"
    show(rn.left) unless rn.left == nil
    print "Ri:"
    show(rn.right) unless rn.right == nil
  end
  
  def insert(n, rn)
    res = rn <=> n
    case res
    when 1
      rn.left == nil ? rn.left = Node.new(n) : insert(n, rn.left)
    when -1
      rn.right == nil ? rn.right = Node.new(n) : insert(n, rn.right)
    else       
      puts "\nInput already exists!"
    end
  end
  
  def find(n, rn = @root)
    nodeFound = nil
    res = rn <=> n
    case res
    when 1
      find(n, rn.left) if rn.left != nil
    when -1
      find(n, rn.right) if rn.right != nil
    else    
      nodeFound = rn
    end
    return nodeFound
  end
  
  def delete(n, rt = @root)
    node = find(n) 
    if node != nil
      puts "\nDeleted"
    end
  end
end