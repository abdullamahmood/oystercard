require_relative 'journey'

class JourneyLog

  MIN_FARE = 1
  PENALTY_FARE = 6

	attr_reader :history, :current_journey, :in_journey

	def initialize
		 @previous_journeys = []
		 @current_journey = Journey.new
		 @in_journey = false
	end 

	def start_journey(station)
		in_journey? ? end_journey(:incomplete) : @current_journey.entry_station = station
		@current_journey.in_journey = true

	end

	def end_journey(station)
		@current_journey.exit_station = station
		@in_journey = false
		add_journey
		@current_journey = Journey.new
		
	end

	 def fare
	 	incomplete? ? PENALTY_FARE : MIN_FARE
	  end

  private

  def add_journey
  	@previous_journeys << @current_journey
  end 

  def in_journey?
  	@current_journey.entry_station && @current_journey.exit_station.nil?
  end 

 def incomplete?
 	[previous_journeys.entry_station, @previous_journeys.exit_station].include? :incomplete
end

end 