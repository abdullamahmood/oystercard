require_relative "journey_log"

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @log = JourneyLog.new
  end

  def top_up(amount)
    fail "Maximum card balance exceeded. Maximum balance is: #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    finish_journey if in_journey?
    fail "Insufficient balance." if @balance < MINIMUM_BALANCE
    @log.start(entry_station)
  end

  def touch_out(exit_station)
    @log.finish(exit_station)
    deduct
  end

  private

  attr_reader :journey, :balance, :log

  def deduct
    @balance -= log.journeys.last.fare
  end

  def finish_journey
    @log.finish(:Incomplete)
    deduct
  end

  def in_journey?
    log.in_journey?
  end

end