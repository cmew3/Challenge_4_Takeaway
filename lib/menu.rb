require_relative 'dish'

class Menu
	
	attr_reader :dishes

	def initialize dishes = []
		@dishes = dishes
	end

	def add dish
		@dishes << dish
	end

	def remove dish_name
		@dishes.delete_if { |dish| dish.name == dish_name }
	end

	# def print_as_list 
	# 	print_header
	# 	for i in 1..dishes.length
	# 		puts "#{i}. #{dishes[i-1].name}    £#{dishes[i-1].price}"
	# 	end
	# end

	# def print_header
	# 	puts "#{self.class}"
	# 	puts "-"*(self.class.to_s.length)
	# end
end
