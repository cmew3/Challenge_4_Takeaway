test_script.rb

require './lib/restaurant'

bobs= Restaurant.new("Bob's Cafe")
charlotte = Customer.new(name: "Charlotte",number: "+447775905676")

bobs.create_menu
bobs.menu.load_from("menu.csv")
charlotte.request_menu_from bobs
charlotte.place_order_at bobs