require 'oystercard'

describe Oystercard do

  before(:each) do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe "#in_journey?" do

    before(:each) do
      subject.touch_in(entry_station)
    end

  end

  describe "#top_up" do

  	it "should raise an error if balance reaches card capacity." do
  		expect{subject.top_up(1)}.to raise_error("Maximum card balance exceeded. Maximum balance is: #{Oystercard::MAXIMUM_BALANCE}")
  	end
  end

  describe "#touch_out" do

    before(:each) do
      subject.touch_in(entry_station)
    end
  end

end