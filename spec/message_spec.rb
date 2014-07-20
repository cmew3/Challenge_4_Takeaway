require 'message'

describe Message do
	let(:message) {Message.new}
	
	it 'generates a message with the correct time' do
		allow(message).to receive(:time_estimate).and_return("6:00 PM")
		expect(message.generate_message_body).to eq "Thank you! Your order was placed and will be delivered before 6:00 PM"
	end

	it 'sends a message to the customer' do
		allow(message).to receive(:time_estimate).and_return("6:00 PM")
		expect(message.client.account.messages).to receive(:create).with(
			:body => "Thank you! Your order was placed and will be delivered before 6:00 PM",
    		:to => "+447775905676",
   			:from => "+441565760052")
		message.generated_message
	end

end	