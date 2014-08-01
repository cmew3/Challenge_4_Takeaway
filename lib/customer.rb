class Customer

	attr_reader :order, :name, :number

	def initialize name: name, number: number
		@order = nil
		@name = name
		@number = number
	end

	def request_menu_from restaurant
		restaurant.print_menu
	end

	def place_order_at restaurant
		@order=Order.new
		restaurant.get_order_details_from self
	end

end	