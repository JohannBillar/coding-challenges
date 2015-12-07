class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end

end

def print_values(list_node)

	print "#{list_node.value} --> "

	if list_node.next_node.nil?
		print "nil\n"
		return
	else
		print_values(list_node.next_node)
	end

end

class Stack
	attr_reader :data

	def initialize
		@data = nil
	end

	#push a value onto the stack
	def push(value)
		if @data.nil?
			@data = LinkedListNode.new(value, nil)
		else
			@data = LinkedListNode.new(value, @data)
		end
	end

	#pop item of the stack
	#remove the last item that was pushed onto the stack
	#and return the value to the user
	def pop
		popped = @data.value
		@data = @data.next_node
		popped
	end
end

def reverse_list(list)
	rev = nil

	while list
		rev = LinkedListNode.new(list.value, rev)
		list = list.next_node
	end

	rev
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"

revlist = reverse_list(node3)
print_values(revlist)

## expected output
## 12 --> 99 --> 37 --> nil
## -------
## 37 --> 99 --> 12 --> nil
