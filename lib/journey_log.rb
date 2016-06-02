require_relative 'journey'

class JourneyLog

  MIN_FARE = 1
  PENALTY_FARE = 6

	attr_reader :history

	def initialize
		@history = []
	end 

	def start_journey(station)
		@current_journey = Journey.new
		@current_journey.entry_station = station
	end

	def end_journey(station)
		@current_journey.exit_station = station
		add_journey
		@current_journey = Journey.new
	end

	 def fare
	    return PENALTY_FARE if incomplete_journey?
	    MIN_FARE
	  end

  private

	  def incomplete_journey?
	    	(@current_journey.entry_station and !@current_journey.exit_station) or (!@current_journey.entry_station and @current_journey.exit_station)
	  end

		def add_journey
			@history << @current_journey
		end 
end