require_relative 'station'

class Journey

  MAXIMUM_FARE = 6
  MINIMUM_FARE = 1

  def start(station)
    @start_station = station
  end

  def finish(station)
    @finish_station = station
  end

  def fare
    complete? ? zone_charge : MAXIMUM_FARE
  end

  def in_journey?
    !!@start_station && @finish_station.nil?
  end


  private

  attr_reader :start_station, :finish_station

  def complete?
    ![@start_station, @finish_station].include? :Incomplete
  end

  def zone_charge
    MINIMUM_FARE + (start_station.zone - finish_station.zone).abs
  end

end