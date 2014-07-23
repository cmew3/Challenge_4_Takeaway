require_relative 'dish'
require 'csv'

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


	def save_to filename
		CSV.open(filename, "wb") do |csv|
			dishes.each do |dish|
				csv << dish.to_csv
			end
		end
	end

	def load_from filename
		CSV.foreach(filename) do |row|
			add Dish.new(row[0],price: row[1].to_i)
		end
	end

end
