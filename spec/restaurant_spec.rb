require 'restaurant'

describe Restaurant do
	
	let(:restaurant)	 { Restaurant.new "Makers Canteen" }
	let(:dish1)			{double :dish1}
	let(:dish2)			{double :dish2}
	let(:dish1) 	{ Dish.new("Ham and leek pie", price: 6.5)	}
	let(:dish2) 	{ Dish.new("Thai green curry", price: 7.5)	}
	let(:dish3)		{ Dish.new("Fish and chips", price: 8.5)	}	 

	before(:each)	 	 { allow(STDOUT).to receive(:puts) }

	
	it 'can process an order for a customer' do

	end

	it 'adds a dish to a customer order' do
		order = double :order
		customer = double :customer, order: order
		dish1 = double :dish1
		dish2 = double :dish2
		restaurant.create_menu([dish1,dish2])
		allow(restaurant).to receive(:gets).and_return("2","4","\n")
		expect(order).to receive(:add).with(dish2,quantity: 4)
		restaurant.ask_for_dish_from customer
	end

	xit 'asks the customer for dishes until they are finished' do
		order= Order.new
		customer = double :customer, order: order
		restaurant.create_menu([dish1,dish2,dish3])
		allow(restaurant).to receive(:gets).and_return("2","4","Y","3"," ")
		restaurant.get_order_details_from customer
		expect(customer.order.dishes).to eq[dish1,dish2]
	end

end