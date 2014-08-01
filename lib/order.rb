require_relative 'dish'

class Order
	
	attr_reader :items, :total

	def initialize items = []
		@items = items
	end

	def add dish, quantity = 1
		@items << {dish: dish, quantity: quantity}
	end

	def remove dish_name
		@items.delete_if { |item| item[:dish].name == dish_name }
	end

	def total_price
		items.inject(0) do |result,item|
			result + item[:dish].price*item[:quantity]
		end	
	end

	def total_quantity
		items.inject(0) do |result,item|
			result + item[:quantity]
		end	
	end


# 	def print_as_list 
# 		print_header
# 		for i in 1..items.length
# 			puts "#{i}. #{items[i-1].name}    £#{items[i-1].price}"
# 		end
# 	end

# 	def print_header
# 		puts "#{self.class}"
# 		puts "-"*(self.class.to_s.length)
# 	end
end
