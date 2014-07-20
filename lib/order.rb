require_relative 'dish'

class Order
	
	attr_reader :dishes, :total

	def initialize dishes = []
		@dishes = dishes
	end

	def add dish, quantity: number = 1
		@dishes << dish
		dish.quantity += quantity
	end

	def remove dish_name
		@dishes.delete_if { |dish| dish.name == dish_name }
	end

	def total_price
		dishes.inject(0) do |result,dish|
			result + dish.price*dish.quantity
		end	
	end

# 	def print_as_list 
# 		print_header
# 		for i in 1..dishes.length
# 			puts "#{i}. #{dishes[i-1].name}    £#{dishes[i-1].price}"
# 		end
# 	end

# 	def print_header
# 		puts "#{self.class}"
# 		puts "-"*(self.class.to_s.length)
# 	end
end
