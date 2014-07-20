require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
# account_sid = 'ACade5c4cc67e5ef4715c2cc55cbedcc46'
# auth_token = 'b2c896b9411452bceff8e351660d93bf'
# @client = Twilio::REST::Client.new account_sid, auth_token
 
# message = @client.account.messages.create(
# 	:body => "Jenny please?! I love you <3",
#     :to => "+447775905676",
#     :from => "+441565760052")
# puts message.to

class Message

	attr_reader :customer_number, :restaurant_number, :time_estimate, :client

	def initialize customer_number = "+447775905676", restaurant_number = "+441565760052"
		@account_sid = 'ACade5c4cc67e5ef4715c2cc55cbedcc46'
		@auth_token = 'b2c896b9411452bceff8e351660d93bf'
		@client = Twilio::REST::Client.new @account_sid, @auth_token
		@restaurant_number = restaurant_number
		@customer_number = customer_number
	end
		
	def send 
		puts generated_message.to
	end

	def generated_message
		message = @client.account.messages.create(
			:body => generate_message_body,
    		:to => customer_number,
   			:from => restaurant_number)
	end


	def generate_message_body
		"Thank you! Your order was placed and will be delivered before #{time_estimate}"
	end

	def time_estimate
		(Time.now + 60*60).strftime "%l:%M %p"
	end

end