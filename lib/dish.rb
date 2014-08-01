class Dish

	attr_reader :name, :price

	def initialize name, price: price	
		@name = name
		@price = price	
	end

	def to_csv
		[name.to_s,price.to_s]
	end

end