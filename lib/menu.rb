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


end
