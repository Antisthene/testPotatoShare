class Share::BestBuy < Share::Base
  attr_accessor :result

  def initialize(year=2022, month=11, day=8)
    super
    @result = {buy: 0, gain: 0}
  end

  def valid?
    check_date? && any_share?
  end
  
  def analyze
    @result = data_result.max_by{|data| data[:gain]}
  end

  private

  def data_result
    results = []
    total.times do |n|
      price = shares[n].value
      gain = 0 
      shares[n..total].each do |share|
        gain += (share.value - price)  
      end
      results << { buy: price, id: shares[n].id, gain: gain }
    end
    results
  end

  def lower
    @lower ||= shares.pluck(:value).min
  end

  def total
    @total ||= shares.count - 1
  end
end
