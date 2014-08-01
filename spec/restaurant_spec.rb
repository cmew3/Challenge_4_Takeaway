require 'restaurant'

describe Restaurant do
	
	let(:restaurant)	 { Restaurant.new "Makers Canteen" 			}
	let(:dish1) 		 { Dish.new("Ham and leek pie", price: 6.5)	}
	let(:dish2) 		 { Dish.new("Thai green curry", price: 7.5)	}
	let(:order) 	 	 { Order.new 								}
	let(:customer)		 { double :customer, order: order           }

	before(:each)	 	 { allow(STDOUT).to receive(:puts) 			}	
	before(:each)	 	 { restaurant.create_menu([dish1,dish2])	}

	
	it 'can print the menu' do
		expect(STDOUT).to receive(:puts).with("Makers Canteen Menu")
		expect(STDOUT).to receive(:puts).with("1. Ham and leek pie    £6.5")
		expect(STDOUT).to receive(:puts).with("2. Thai green curry    £7.5")
		restaurant.print_menu
	end

	it 'adds a dish to a customer order' do
		allow(restaurant).to receive(:gets).and_return("2","4","\n")
		expect(order).to receive(:add).with(dish2,4)
		restaurant.ask_for_dish_from customer
	end

	it 'asks the customer for dishes until they are finished' do
		allow(restaurant).to receive(:gets).and_return("2","4","Y","1","1","N")
		restaurant.get_order_details_from customer
		expect(customer.order.total_quantity).to eq 5
	end

	it 'can print the order' do
		customer.order.add(dish1,2)
		expect(STDOUT).to receive(:puts).with("Order Summary")
		expect(STDOUT).to receive(:puts).with("1. Ham and leek pie    Quantity: 2    Price: £13.0")		
		expect(STDOUT).to receive(:puts).with("Order total: £13.0")
		restaurant.print_order_from customer
	end

	it 'sends the customer a message if it confirms the order' do
		customer.order.add(dish1,2)
		allow(restaurant).to receive(:gets).and_return("Y")
		expect(restaurant).to receive(:send_message_to).with(customer)
		restaurant.process_order_from customer
	end

	it 'does not send a message if customer cancels order' do
		customer.order.add(dish1,2)
		allow(restaurant).to receive(:gets).and_return("N")
		expect(restaurant).not_to receive(:send_message_to).with(customer)
		restaurant.process_order_from customer
	end

end