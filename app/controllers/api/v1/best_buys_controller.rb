class Api::V1::BestBuysController < Api::V1::ApplicationController
  include PotatoShareMethods

  def index
    render json: { result: result}
  end

  private

  def result
    data = Share::BestBuy.new(year, month, day)
    data.analyze if request_valid? && data.valid?
    data.result
  end

  def year
    params.dig(:selected_date,:year)
  end

  def month
    params.dig(:selected_date,:month)
  end

  def day
    params.dig(:selected_date,:day)
  end
end
