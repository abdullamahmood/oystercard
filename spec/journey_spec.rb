require "journey"

describe Journey do
  let(:station) { double(:station) }

  it "should have no entry station on instantiation" do
    expect(subject.entry_station).to be_nil
  end

  it "should have no exit station on instantiation" do
    expect(subject.exit_station).to be_nil
  end

  it "should store a name of an entry station" do
    subject.entry_station = station
    expect(subject.entry_station).to eq station
  end

  it "should store a name of an exit station" do
    subject.exit_station = station
    expect(subject.exit_station).to eq station
  end

  describe "#in_journey?" do
    context "has neither entry nor exit stations" do
      it "should not be in journey" do
        expect(subject).to_not be_in_journey
      end
    end

    context "has an exit station" do
      before do
        subject.exit_station = station
      end

      it "should not be in journey" do
        expect(subject).to_not be_in_journey
      end
    end

    context "has an entry station but no exit station" do
      before do
        subject.entry_station = station
      end

      it "should be in journey" do
        expect(subject).to be_in_journey
      end
    end

    context "has both entry and exit station" do
      before do
        subject.entry_station = station
        subject.exit_station = station
      end

      it "should not be in journey" do
        expect(subject).to_not be_in_journey
      end
    end
  end
end
