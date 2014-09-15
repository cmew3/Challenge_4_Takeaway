Challenge_4_Takeaway
====================

Makers Academy Week 4 Challenge - Part 2
----------------------------

Challenge to create a takeway ordering program in Ruby. The program provides a list of dishes with prices and allow customers to place an order by giving the list of dishes, their quantities and a number that should be the exact total. Once an order is placed, the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now.

###Notes
  + The text sending functionality was implemented using Twilio API (note the free version only works with pre-registered numbers)
  + We use the twilio-ruby gem to access the API
  + Use a Gemfile to manage your gems
  + Unit tested using rspec with mocks and/or stubs, as necessary to avoid sending texts when running tests
  + However, if program is loaded into IRB and the order is placed, the text is sent (provided number + Focus for the challenge was on good OO design and programming. In particular, the SOLID principles!


How to run tests
----------
Tested using [rspec](https://github.com/rspec/rspec)

```shell
git clone https://github.com/cmew3/Challenge_4_Takeaway.git
cd Challenge_4_Takeaway
rspec
```

How to run program
--------------
Example commands for running in irb:

```shell
require './lib/restaurant'
bobs= Restaurant.new("Bob's Cafe")
alice = Customer.new(name: "Alice")
bobs.create_menu
bobs.menu.load_from("menu.csv")
alice.request_menu_from bobs
alice.place_order_at bobs
```
