require 'menu'

describe Menu do
	
	let(:dish1) 	{ Dish.new("Ham and leek pie", price: 6.5)	}
	let(:dish2) 	{ Dish.new("Thai green curry", price: 7.5)	}
	let(:dish3)		{ Dish.new("Fish and chips", price: 8.5)	}	 
	let(:menu) 		{ Menu.new									}
	let(:pub_menu) 	{ Menu.new([dish1,dish2,dish3])									}

	it 'has no dished when created' do
		expect(menu.dishes).to eq []
	end

	it 'can be created with a list of dishes' do
		expect(pub_menu.dishes).to eq [dish1,dish2,dish3]
	end

	it 'can add a dish' do
		menu.add dish1
		expect(menu.dishes).to eq [dish1]
	end

	it 'can delete a dish by name' do
		pub_menu.remove("Fish and chips")
		pub_menu.remove(dish3)
		expect(pub_menu.dishes).to eq [dish1,dish2]
	end

	it 'can be loaded from a csv file' do	
		csv = ["Thai green curry", "7"]
		allow(CSV).to receive(:foreach).with("./menu.csv").and_yield(csv)
		menu.load_from "./menu.csv"
		expect(menu.dishes[0].name).to eq "Thai green curry"
		expect(menu.dishes[0].price).to eq 7
	end

	it 'can be saved to a csv file' do
		menu.add dish1
		menu.add dish2
		csv = double
		expect(csv).to receive(:<<).with(dish1.to_csv)
		expect(csv).to receive(:<<).with(dish2.to_csv)
		allow(CSV).to receive(:open).with("./menu.csv","wb").and_yield(csv)
		menu.save_to "./menu.csv"
	end
end	

