require 'restaurant'

describe Restaurant do
	
	let(:restaurant) {Restaurant.new "Makers Canteen"}
	
	it 'asks the customer for a dish to add' do
		order = double :order
		customer = double :customer, order: order
		dish1 = double :dish1
		dish2 = double :dish2
		dish3 = double :dish3
		restaurant.create_menu([dish1,dish2,dish3])
		allow(restaurant).to receive(:gets).and_return("2","4")
		expect(order).to receive(:add).with(dish2,quantity: 4)
		restaurant.ask_for_dish_from customer
	end

end