require 'twilio-ruby'

class Message

	attr_reader :customer, :restaurant, :time_estimate, :client

	def initialize to: customer, from: restaurant	
		@account_sid = 'ACade5c4cc67e5ef4715c2cc55cbedcc46'
		@auth_token = 'b2c896b9411452bceff8e351660d93bf'
		@client = Twilio::REST::Client.new @account_sid, @auth_token
		@restaurant= from
		@customer = to
	end
		
	def send 
		puts generated_message.to
	end

	def generated_message
		message = @client.account.messages.create(
			:body => generate_message_body,
    		:to => customer.number,
   			:from => restaurant.number)
	end

	def generate_message_body
		"Thank you #{customer.name}! Your order was placed and will be delivered before #{time_estimate}. The total price for your order is £#{customer.order.total_price}"
	end

	def time_estimate
		(Time.now + 60*60).strftime "%l:%M %p"
	end

end