class Customer

	attr_reader :order, :name, :contact_number

	def initialize name: name, contact_number: contact_number
		@order = nil
		@name = name
		@contact_number = contact_number
	end

	def create_order
		@order = Order.new
	end

end	