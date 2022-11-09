class Share::Base
  START_HOUR = 9
  MAX_COUNT = 100
  AVERAGE_PRICE = 100

  def initialize(year=2022, month=11, day=8)
    @year = year
    @month = month
    @day = day
  end

  private

  def check_date?
    Time.new(@year, @month, @day) rescue nil
  end

  def empty_share?
    shares.none?
  end

  def any_share?
    shares.any?
  end

  def shares
    @shares ||= PotatoShare.at_date(@year, @month, @day).order(store_time: :asc)
  end
end
