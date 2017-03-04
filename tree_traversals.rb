class Node
  attr_accessor :value, :left, :right

  def initialize value
    @value = value
  end
end

def preorder node
  print " #{node.value} "
  preorder node.left if node.left
  preorder node.right if node.right
end

def postorder node
  postorder node.left if node.left
  postorder node.right if node.right
  print " #{node.value} "
end

def inorder node
  inorder node.left if node.left
  print " #{node.value} "
  inorder node.right if node.right
end

puts "-----------------TREE---------------------"
puts "      4"
puts "    /   \\"
puts "   2     6"
puts "  / \\   / \\"
puts " 1   3 5   7"
puts "------------------------------------------"
root = Node.new(4)

root.left = Node.new(2)
root.left.left = Node.new(1)
root.left.right = Node.new(3)

root.right = Node.new(6)
root.right.left = Node.new(5)
root.right.right = Node.new(7)

puts "----- Preorder ---------------------------"
preorder root
puts "\n------------------------------------------"

puts "----- Postorder --------------------------"
postorder root
puts "\n------------------------------------------"

puts "----- Inorder ----------------------------"
inorder root
puts "\n------------------------------------------"
