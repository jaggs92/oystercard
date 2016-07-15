require_relative 'oystercard'

class Journey

  PENALTY_FARE = 6

  attr_reader :list_of_journeys, :valid

  def initialize
    @list_of_journeys = []
    @entry_count = 0
    @exit_count = 0
  end

  def start_journey(entry_station)
    set_counters_in entry_station
    greeting_message
    @message
  end

  def end_journey(exit_station)
    set_counters_out exit_station
    greeting_message
    store_journey
    @message
  end

  def fare
    if @entry_count > 1 || @exit_count > 1
      Journey::PENALTY_FARE
    else
      Oystercard::MINIMUM_FARE
    end
  end

  def set_counters_in entry_station
    @exit_count = 0
    @entry_count += 1
    @entry_station = entry_station
  end

  def set_counters_out exit_station
    @entry_count = 0
    @exit_count += 1
    @exit_station = exit_station
  end

  private

  def store_journey
    @list_of_journeys << {:entry_station => @entry_station, :exit_station => @exit_station}
  end

  def greeting_message
    if @entry_count > 1 || @exit_count > 1
      @message = "You didn't touch in/out."
    else
      @message = "Welcome, have a nice day!"
    end
  end
end
