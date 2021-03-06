class Oystercard
DEFAULT_BALANCE = 0
MAX_LIMIT = 90
MIN_LIMIT = 1

  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

	def top_up(amount)
		message = "Maximum limit of £#{Oystercard::MAX_LIMIT} reached"
		raise message if amount + balance > MAX_LIMIT
		@balance += amount
		self
	end

	def deduct(amount)
		@balance -= amount
		self
	end

	def touch_in
		message = "Insufficient funds: must have at least £#{Oystercard::MIN_LIMIT}!"
		raise message if insufficient_funds?
		@in_journey = true
		@balance
	end 
	def touch_out
		@in_journey = false
		@balance
	end

	def in_journey?
		@in_journey ||= false # ||= sets to false if it hasn't been initialized or set earlier (i.e. if it's equal nil)
	end

	private 

	def insufficient_funds?
		balance < 1
	end 

end 

