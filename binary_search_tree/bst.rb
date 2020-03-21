require './node.rb'

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
    show(rn.left) unless rn.left == nil
    show(rn.right) unless rn.right == nil
  end
  
  def insert(n, rn = @root)
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
    res = rn <=> n
    case res
    when 1
      return find(n, rn.left) if rn.left != nil
    when -1
      return find(n, rn.right) if rn.right != nil
    else    
      return rn
    end
  end
  
  def delete(num, rt = @root)
    node = find(num)
    if node != nil
      pnode = getParent(node)
      childNode = nil
      case node.hasChildren()
        when 0 #leaf Node          
          pnode == nil ? @root = nil : (pnode.left == node ? pnode.left = nil : pnode.right = nil)
        when 1 #one child
          node.left == nil ? childNode = node.right : childNode = node.left
          if pnode == nil
            @root = childNode
          else          
            pnode.left == node ? pnode.left = childNode : pnode.right = childNode
          end
        else #two chinldren
          # Replace parent child(left or right) with node's left child and 
          # append the node's right child to right position       
          rightNode = node.right
          oldRightNode = node.left.right
          node.left.right = node.right
          
          pnode == nil ? @root = node.left : pnode.left = node.left
          
          while rightNode != nil
            if rightNode.left == nil
              rightNode.left = oldRightNode
              break
            end
            rightNode = rightNode.left
          end
      end
      puts "\nThe node is deleted"
    end
  end
  
  def getParent(n, rn = @root)
    if (rn.left == n || rn.right == n)
      return rn
    elsif rn != nil
      case rn <=> n
        when -1
          getParent(n, rn.right)
        when 1
          getParent(n, rn.left)
        else
          return nil
      end
    else
      return nil
    end
  end
  
  def level_order
    queue = [@root]
    data = []
    
    until queue.empty?
      node = queue.shift()
      block_given? ? yield(node) : data.push(node.data)
      queue.unshift(node.left) if node.left
      queue.unshift(node.right) if node.right
    end
    
    return data unless block_given?
  end
  
  def inorder(data = [], rt = @root)
    inorder(data, rt.left) if rt.left
    block_given? ? yield(rt) : data.push(rt.data)
    inorder(data, rt.right) if rt.right
    
    return data unless block_given?
  end
  
  def preorder(data = [], rt = @root)
    block_given? ? yield(rt) : data.push(rt.data)
    preorder(data, rt.left) if rt.left    
    preorder(data, rt.right) if rt.right
    
    return data unless block_given?
  end
  
  def postorder(data = [], rt = @root)
    postorder(data, rt.left) if rt.left    
    postorder(data, rt.right) if rt.right
    block_given? ? yield(rt) : data.push(rt.data)
    
    return data unless block_given?
  end
    
    def depth node=@root
        return 0 if !node
        depth = 1
        leftDepth = depth(node.left)
        rightDepth = depth(node.right)
        depth += leftDepth > rightDepth ? leftDepth : rightDepth
    end

    def balanced?
        leftDepth = depth(@root.left)
        rightDepth = depth(@root.right)
        diff = (leftDepth - rightDepth).abs
        return diff < 2 ? true : false
    end

    def rebalance!
        arr = inorder
        initialize(arr)
    end
end