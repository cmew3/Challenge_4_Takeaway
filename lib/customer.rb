class Customer

	attr_reader :orders, :name, :contact_number

	def initialize name, contact_number
		@orders = []
		@name = name
		@contact_number = contact_number
	end

	def create_order
		@orders << Order.new
	end

end