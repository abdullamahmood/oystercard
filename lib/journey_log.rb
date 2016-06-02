class JourneyLog

	attr_reader :history

	def initialize 
		@history = []
	end 

	def add_journey(journey)
		@history << journey
	end
end