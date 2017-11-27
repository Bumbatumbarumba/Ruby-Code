=begin
Created by Bartosz Kosakowski
A binary heap in java that allows for adding and removing
of nodes
=end

class BinaryHeap
	@@root = nil;

	#used to add a new node to the tree
	def addNode(newNode)
		#first we check if the root is empty; if yes, we make the newNode
		#the root, otherwise we move on deeper into the heap
		if @@root == nil then
			@@root = newNode;
		else
			addRest(@@root, newNode);
		end
	end #end of addNode

	#we look at the current node to see where we can put newNode
	def addRest(currentNode, newNode)
		#first we check if the newNode has a greater value than the currentNode; if
		#yes, then we have to add it to the right side
		if newNode.getVal > currentNode.getVal then
			if !currentNode.hasRight then
				currentNode.setRight(newNode);
			else
				addRest(currentNode.getRight, newNode);
			end
		elsif newNode.getVal < currentNode.getVal then
			if !currentNode.hasLeft then
				currentNode.setLeft(newNode);
			else
				addRest(currentNode.getLeft, newNode);
			end
		else
			puts "Duplicates not allowed; Node with #{newNode.getVal} not added";
		end
	end #end of addRest

	def removeNode()
	end

	def tree()
		printTree(@@root);
	end

	#traverses and prints the tree
	def printTree(currentNode)
		#prints parent node value
		puts "parent: #{currentNode.getVal}";
		#prints left child if present
		if currentNode.hasLeft then
			puts "left child: #{currentNode.getLeft.getVal}";
		else
			puts "no left child";
		end
		#prints right child if present
		if currentNode.hasRight then
			puts "right child: #{currentNode.getRight.getVal}";
		else
			puts "no right child";
		end

		#traverses left and right children if present
		if currentNode.hasLeft then
			printTree(currentNode.getLeft);
		end
		if currentNode.hasRight then 
			printTree(currentNode.getRight);
		end
	end #end of printTree
end #end of BinaryHeap class

class Node
	@val = 0;
	@leftChild = nil;
	@rightChild = nil;
	
	def initialize(someVal)
		@val = someVal;
	end

	#getters for Node objects
	def getVal()
		return @val;
	end
	def getLeft()
		return @leftChild;
	end
	def getRight()
		return @rightChild
	end

	#setters for Node obj
	def setLeft(newLeft)
		@leftChild = newLeft;
	end
	def setRight(newRight)
		@rightChild = newRight;
	end

	#check for presence of left and right children
	def hasLeft()
		return !@leftChild.nil?;
	end
	def hasRight()
		return !@rightChild.nil?;
	end
end #end of Node class


#testing heap
heap = BinaryHeap.new;
counter = 0;
until counter == 15 do
	heap.addNode(Node.new(rand(50)));
	counter += 1
end
heap.tree;