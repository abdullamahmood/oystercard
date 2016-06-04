class Journey


  attr_accessor :entry_station, :exit_station, :in_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @in_journey = false
  end

  def in_journey?
    @entry_station && @exit_station.nil?
  end
end

