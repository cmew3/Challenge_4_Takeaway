require_relative 'dish'
require_relative 'order'
require_relative 'menu'
require_relative 'customer'
require_relative 'message'

# creates dishes
# creates menu (either manually or from file)
# asks customer for order
# sends customer message

class Restaurant
	
	def initialize name, number = "+441565760052"
		@name = name
		@number = number
	end

	attr_reader :name, :menu, :number

	def create_menu dishes =[]
		@menu =Menu.new(dishes)
	end
		
	def print_menu 
		print_header
		for i in 1..menu.dishes.length
			puts "#{i}. #{menu.dishes[i-1].name}    £#{menu.dishes[i-1].price}"
		end
	end

	def print_header
		puts "#{name} Menu"
		puts "-"*(name.length+5)
	end

	def get_order_details_from customer
		loop do
			ask_for_dish_from customer
			puts "Would you like to add another dish (Y/N)?"
			selection = gets.chomp
			break unless selection == "Y"
		end
		process_order_from customer
	end

	def ask_for_dish_from customer
		puts "Please make your dish selection (select menu number) or press enter if you have finished your order"
		dish_number = gets.chomp.to_i
		puts "Please enter quantity of dish"
		quantity = gets.chomp.to_i
		customer.order.add(menu.dishes[dish_number-1], quantity)
	end

	def confirm_order_from customer
			print_order_from customer
			puts "Please confirm ('Y') or cancel ('N') your order"
			gets.chomp
	end

	def print_order_from customer
		puts "Order Summary"
		for i in 1..customer.order.items.length
			puts "#{i}. #{customer.order.items[i-1][:dish].name}    Quantity: #{customer.order.items[i-1][:quantity]}    Price: £#{customer.order.items[i-1][:dish].price*customer.order.items[i-1][:quantity]}"
		end 
			puts "Order total: £#{customer.order.total_price}"
	end

	def process_order_from customer
		selection = confirm_order_from customer
		case selection
		when "Y"
			send_message_to customer
		else
			puts "Order has been cancelled"
		end
	end	

	def send_message_to customer
		message = Message.new(to: customer, from: self)
		message.send
	end

end