require 'dish'

describe Dish do

	let(:dish) {Dish.new("Ham and leek pie", price: 6.5)}

	it 'is created with a name' do
		expect(dish.name).to eq "Ham and leek pie"
	end

	it 'is created with a price' do
		expect(dish.price).to eq 6.5
	end

	it 'can be displayed in csv format' do
		expect(dish.to_csv).to eq ["Ham and leek pie", "6.5"]
	end

end