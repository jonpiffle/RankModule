module Rank
	attr_accessor :size

	def initialize(key)
		super(key)
		self.size = 1
	end

	def right_size
		self.right.nil? ? 0 : self.right.size
	end

	def left_size
		self.left.nil? ? 0 : self.left.size
	end

	def insert(key)
		@size += 1
		super(key)
	end

	def delete(key)
		@size -= 1
		super(key)
	end

	def rotate_right
		c = self.left
		super()
		c.size = self.size
		@size = left_size + right_size + 1
	end

	def rotate_left
		c = self.right
		super()
		c.size = self.size
		@size = left_size + right_size	
	end

	def rank
		r = left_size + 1
		y = self
		while y.parent
			if y == y.parent.right
				r = r + y.parent.left_size + 1
			end
			y = y.parent
		end
		return r - 1
	end
end