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

	xit 'can be printed' do
		pub_menu.print_as_list
	end

end

