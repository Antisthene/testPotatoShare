class Share::DataGenerator < Share::Base
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
end
