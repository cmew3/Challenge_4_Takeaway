require 'order'

describe Order do
	
	let(:dish1) 	{ Dish.new("Ham and leek pie", price: 6.5)	}
	let(:dish2) 	{ Dish.new("Thai green curry", price: 7.5)	}
	let(:dish3)		{ Dish.new("Fish and chips", price: 8.5)	}	 
	let(:order) 	{ Order.new									}
	let(:test_order) 	{ Order.new([dish1,dish2,dish3])									}

	it 'has no dished when created' do
		expect(order.items).to eq []
	end

	it 'can be created with a list of items' do
		expect(test_order.items).to eq [dish1,dish2,dish3]
	end

	it 'can add a dish' do
		order.add dish1
		expect(order.items).to eq [{dish: dish1, quantity: 1}]
	end	

	it 'can delete a dish by name' do
		test_order.remove("Fish and chips")
		test_order.remove(dish3)
		expect(test_order.items).to eq [dish1,dish2]
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