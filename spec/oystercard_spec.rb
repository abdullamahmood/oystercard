require 'oystercard'

describe Oystercard do	
 subject(:oystercard) {described_class.new}


	# it { is_expected.to respond_to(:top_up).with(1).argument }
	describe "#top_up" do
		it 'tops up the card and increases the balance' do
			expect{oystercard.top_up(10)}.to change{oystercard.balance}.by 10
			expect{oystercard.top_up(1)}.to change{oystercard.balance}.by 1
		end
		it 'has a maximum limit of 90' do
			message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
			expect{oystercard.top_up(91)}.to raise_error message
		end 
	end
	describe "#deduct" do
		it 'deducts the money from the balance' do
			expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
		end
	end

	describe "#touch_in" do
		it 'touches in the station' do
			expect(oystercard.touch_in).to eq oystercard.balance
		end
	end 

	describe "#touch_out" do
		it 'touches out of the station' do
			expect(oystercard.touch_out).to eq oystercard.balance
		end
	end 

	describe "#in_journey?" do
		it 'should not be in journey when initialized' do
			expect(oystercard).to_not be_in_journey
		end
		it 'should be in journey whe travel starts' do
			oystercard.touch_in
			expect(oystercard).to be_in_journey
		end
	end	
end