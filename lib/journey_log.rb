require_relative "journey"

class JourneyLog

  attr_reader :journeys, :current_journey

  def initialize(journey = Journey.new)
    @journeys = []
    @current_journey = journey
  end

  def start(station)
    finish(:Incomplete) if in_journey?
    @current_journey.start(station)
  end

  def finish(station)
    in_journey? ? complete_journey(station) : incomplete_journey(station)
    new_journey
  end

private

  def new_journey(journey = Journey.new)
    @journeys << @current_journey
    @current_journey = journey
  end

  def in_journey?
    @current_journey.in_journey?
  end

  def complete_journey(station)
    @current_journey.finish(station)
  end

  def incomplete_journey(station)
    @current_journey.start(:Incomplete)
    @current_journey.finish(station)
  end

end