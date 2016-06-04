require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  let(:start_station) {double :start_station, zone: 1}
  let(:finish_station) {double :finish_station,zone:  1}

  # it "can start a journey" do
  #   journey.start(start_station)
  #   expect(journey.start_station).to eq start_station
  # end
  #
  # it "can finish a journey" do
  #   journey.finish(finish_station)
  #   expect(journey.finish_station).to eq finish_station
  # end

  it "charges a penalty fare for incomplete journeys" do
    journey.start(start_station)
    journey.finish(:Incomplete)
    expect(journey.fare).to eq Journey::MAXIMUM_FARE
  end

  it "charges a default fare for a complete journey" do
    journey.start(start_station)
    journey.finish(finish_station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

  it "returns the status of a journey in progress" do
    journey.start(start_station)
    expect(journey.in_journey?).to eq true
  end

  it "returns the status of a journey completed" do
    journey.start(start_station)
    journey.finish(finish_station)
    expect(journey.in_journey?).to eq false

  end
end
