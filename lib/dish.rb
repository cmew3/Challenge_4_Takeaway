class Dish

	attr_reader :name, :price
	attr_accessor :quantity

	def initialize name, price: price	
		@name = name
		@price = price
		@quantity = 0	
	end

end