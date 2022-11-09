class DataGenerator
  START_HOUR = 9
  MAX_COUNT = 100
  AVERAGE_PRICE = 100

  def initialize(year=2022, month=11, day=8)
    @year = year
    @month = month
    @day = day
  end

  def generate
    current_time = Time.new(@year, @month, @day, START_HOUR)
    MAX_COUNT.times do
      elapse = rand(1...59)
      rate = rand(1..99) / 100.0
      price = elapse.odd? ? AVERAGE_PRICE - rate : AVERAGE_PRICE + rate 
      PotatoShare.create(value: price, store_time: current_time)
      current_time = current_time + elapse.minutes
    end
  end

  def valid?
    check_date? && empty_share?
  end

  private

  def check_date?
    Time.new(@year, @month, @day) rescue nil
  end

  def empty_share?
    PotatoShare.at_date(@year, @month, @day).none?
  end
end
