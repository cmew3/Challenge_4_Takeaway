require_relative 'dish'
require_relative 'order'
require_relative 'menu'
require_relative 'customer'
require_relative 'message'

# creates dishes
# creates menu
# asks customer for order
# sends customer message

class Restaurant
	
	def initialize name, number = "+441565760052"
		@name = name
		@menu =Menu.new
		@number = number
	end

	attr_reader :name, :menu, :number

	def create_menu dishes
		@menu = Menu.new(dishes)
	end
		
	def print_menu 
		print_header
		for i in 1..menu.dishes.length
			puts "#{i}. #{menu.dishes[i-1].name}    £#{menu.dishes[i-1].price}"
		end
	end

	def print_header
		puts "#{name} #{Menu}"
		puts "-"*(name.length+5)
	end

	def ask_for_dish_from customer
		puts "Please make your dish selection (select menu number) or press enter if you have finished your order"
		dish_number = gets.chomp.to_i
		puts "Please enter quantity of dish"
		quantity = gets.chomp.to_i
		customer.order.add(menu.dishes[dish_number-1], quantity: quantity)
	end

	def send_message_to customer
		message = Message.new(to: customer.contact_number, from: number)
		message.send
	end

end