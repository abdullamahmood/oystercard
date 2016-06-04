require "journey_log"
describe JourneyLog do

  subject(:log) {described_class.new(journey)}
  let(:journey) {double :journey, start: nil, finish: nil}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  it "records a journey" do
    allow(journey).to receive(:in_journey?) {false}
    log.start(entry_station)
    allow(journey).to receive(:in_journey?) {true}
    log.finish(exit_station)
    expect(log.journeys).to include(journey)
  end

end