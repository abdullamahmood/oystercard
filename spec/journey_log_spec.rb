require 'journey_log'


describe JourneyLog do
let(:journey) {double :journey}

	describe "#history" do
		it "should respond to each" do
			expect(subject.history).to respond_to(:each)
		end
		
		it "should be empty by default" do
			expect(subject.history).to be_empty
		end 
	end 

	describe '#start_journey' do
		it 'should respond to start_journey' do
			expect(subject).to respond_to(:start_journey)
		end 
		# it 'should create a new journey' do
		# 	expect()
		# end	
	end
	# describe '#add_journey' do
	# 	it 'adds a journey to the history array' do
	# 		expect{subject.add_journey(journey)}.to change {subject.history}
	# 	end 
	# end
end