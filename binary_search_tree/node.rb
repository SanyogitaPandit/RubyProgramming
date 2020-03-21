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
  
  # return 0 if its a leaf
  # returns 1 if it has one child
  # returns 2 if it has two children
  def hasChildren
    if (@left == nil) && (@right == nil)
      return 0
    elsif (@left != nil) && (@right != nil)
      return 2
    else
      return 1
    end
  end
end
