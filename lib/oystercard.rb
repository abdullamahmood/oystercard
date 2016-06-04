require_relative 'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard
	BALANCE_LIMIT = 90
	MIN_LIMIT = 1

	attr_reader :balance, :journey_log, :current_journey, :in_journey

	def initialize
		@balance = 0
		@journey_log = JourneyLog.new
	end

	def top_up(amount)
		fail "Can't add to your balance; would breach the £#{BALANCE_LIMIT} limit" if @balance + amount > BALANCE_LIMIT
		@balance += amount
		self
	end

	def touch_in(station)
		fail "Can't touch in your balance is below £#{MIN_LIMIT}" if @balance < MIN_LIMIT
		journey_log.end_journey if in_journey?
		journey_log.start_journey(station)
		self
	end

	def touch_out(station)
		@journey_log.end_journey(station)
		deduct
	
		self
	end

	private

	def deduct
		@balance -= journey_log.last.fare
	end

	def in_journey?
		@journey_log.in_journey?
	end

	def end_journey
		@journey_log.end_journey(:incomplete)
		deduct
	end
end
