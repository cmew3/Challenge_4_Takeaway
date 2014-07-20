require 'customer'

describe Customer do

	let(:customer) {Customer.new("Charlotte", "+447775905676" )}

	it 'can create an order' do
		customer.create_order
		expect(customer.orders.count).to eq 1	
	end

	it 'is created with a name' do
		expect(customer.name).to eq "Charlotte"
	end

	it 'is created with a contact number' do
		expect(customer.contact_number).to eq "+447775905676"
	end
	
end