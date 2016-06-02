require_relative 'station'
require_relative 'journey_log'

class Oystercard
	BALANCE_LIMIT = 90
	MIN_LIMIT = 1

	attr_reader :balance, :journey_log, :current_journey

	def initialize
		@balance = 0
		@in_journey = false
		@journey_log = JourneyLog.new
		# @current_journey = Journey.new
	end

	def top_up(amount)
		fail "Can't add to your balance; would breach the £#{BALANCE_LIMIT} limit" if @balance + amount > BALANCE_LIMIT
		@balance += amount
		self
	end

	def touch_in(station)
		fail "Can't touch in your balance is below £#{MIN_LIMIT}" if @balance < MIN_LIMIT
		journey_log.start_journey(station)
		# @current_journey.entry_station = station
		self
	end

	def touch_out(station)
		deduct(journey_log.fare)
		journey_log.end_journey(station)
		# @current_journey.exit_station = station
		# @journey_log << @current_journey
		# @journey_log.end_journey(current_journey)
		# @current_journey = Journey.new
		# deduct(@current_journey.fare)
		self
	end

	private

	def deduct(amount)
		@balance -= amount
	end

end
