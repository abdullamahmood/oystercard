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
	end
	
  # describe "#fare" do
  #   context "is a complete journey (with entry and exit station)" do
  #     before do
  #       subject.entry_station = station
  #       subject.exit_station = station
  #     end

  #     it "should return the mimimum fare" do
  #       expect(subject.fare).to eq described_class::MIN_FARE
  #     end
  #   end

  #   context "has an entry station but no exit station" do
  #     before do
  #       subject.entry_station = station
  #     end

  #     it "should return the penalty fare" do
  #       expect(subject.fare).to eq described_class::PENALTY_FARE
  #     end
  #   end

  #   context "has an exit station but no entry station" do
  #     before do
  #       subject.exit_station = station
  #     end
      
  #     it "should return the penalty fare" do
  #       expect(subject.fare).to eq described_class::PENALTY_FARE
  #     end
  #   end



	
end