require 'order'

describe Order do
	
	let(:dish1) 	{ Dish.new("Ham and leek pie", price: 6.5)	}
	let(:dish2) 	{ Dish.new("Thai green curry", price: 7.5)	}
	let(:dish3)		{ Dish.new("Fish and chips", price: 8.5)	}	 
	let(:order) 	{ Order.new									}
	let(:test_order) 	{ Order.new([dish1,dish2,dish3])									}

	it 'has no items when created' do
		expect(order.items).to eq []
	end

	it 'can add an item' do
		order.add dish1
		expect(order.items).to eq [{dish: dish1, quantity: 1}]
	end	

	it 'can delete an item by name' do
		order.add dish1
		order.add dish2
		order.remove("Ham and leek pie")
		expect(order.items).to eq [{dish: dish2,quantity: 1}]
	end

	it 'has a quantity for a dish' do
		order.add(dish1,4)
		expect(order.items.first[:quantity]).to eq 4
	end

	it 'has a total price' do	
		order.add(dish1,1)
		order.add(dish2,2)
		expect(order.total_price).to eq 21.5
	end

	it 'has a total quantity' do
		order.add(dish1,1)
		order.add(dish2,2)
		expect(order.total_quantity).to eq 3
	end
end