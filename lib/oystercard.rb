class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_CREDIT = 1
attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
   fail "Maximum balance of #{MAXIMUM_BALANCE} reached" if balance + amount > MAXIMUM_BALANCE
   @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "No credit on card" if no_credit
    @in_journey = true
  end


  def touch_out
     @in_journey = false
  end

  def in_journey?
     @in_journey
  end

  def no_credit
    @balance < MINIMUM_CREDIT
  end
end
