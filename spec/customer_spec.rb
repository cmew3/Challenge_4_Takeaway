require 'customer'

describe Customer do

	let(:customer) {Customer.new(name: "Charlotte", number: "+447775905676" )}
	let(:restaurant) {double :restaurant}

	it 'is created with a name' do
		expect(customer.name).to eq "Charlotte"
	end

	it 'is created with a contact number' do
		expect(customer.number).to eq "+447775905676"
	end

	it 'can request a menu from a resaurant' do
		expect(restaurant).to receive(:print_menu)
		customer.request_menu_from restaurant
	end
	
	it 'can place an order' do
		allow(restaurant).to receive(:get_order_details_from)
		customer.place_order_at restaurant
		expect(customer.order).to be_a(Order)	
	end

	it 'contacts a restaurant when placing an order' do
		expect(restaurant).to receive(:get_order_details_from).with(customer)
		customer.place_order_at restaurant
	end

end