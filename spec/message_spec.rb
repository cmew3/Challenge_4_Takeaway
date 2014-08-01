require 'message'

describe Message do
	let(:order)	{double :order, total_price: 13.5}
	let(:customer) {double :customer, number: "+447775905676", name: "Charlotte", order: order}
	let(:restaurant) {double :customer, number: "+441565760052"}
	let(:message) {Message.new(to: customer, from: restaurant)}
	
	it 'generates a message with the correct time' do
		allow(message).to receive(:time_estimate).and_return("6:00 PM")
		expect(message.generate_message_body).to eq "Thank you Charlotte! Your order was placed and will be delivered before 6:00 PM. The total price for your order is £13.5"
	end

	it 'sends a message to the customer' do
		allow(message).to receive(:time_estimate).and_return("6:00 PM")
		expect(message.client.account.messages).to receive(:create).with(
			:body => "Thank you Charlotte! Your order was placed and will be delivered before 6:00 PM. The total price for your order is £13.5",
    		:to => "+447775905676",
   			:from => "+441565760052")
		message.generated_message
	end	

end	