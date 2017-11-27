=begin
Bartosz Kosakowski
A proper min heap (values increase going down the tree);
the left value < right, but both > parent
=end

#NOTE: incorporate arrays into this to make it 50 times easier

#PROLLY GONNA HAVE TO DELETE THE STUFF IN THIS CLASS AND USE ARRAYS
class MinHeap
	@@root = nil;

	def addNode(newNode)
		traverseAdd(@@root, newNode);
	end

	def traverseAdd(currentNode, newNode)
		if currentNode.nil? then
			currentNode = newNode;
		else
			traverseAdd(currentNode.getLeft, newNode);
		end
	end
end

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