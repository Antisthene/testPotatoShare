class Api::V1::PotatoSharesController < Api::V1::ApplicationController
  def index
    share_data = request_valid? ? potato_shares : PotatoShare.none
    share_data = share_data.order(store_time: :asc)
    share_data = share_data.limit(page_size).offset(page_offset)

    render json: {potato_shares: share_data.select(:store_time, :value)}, meta: pagination_data
  end

  private

  def potato_shares
    @poptato_shares ||= PotatoShare.at_date(params[:selected_date][:year],
                                      params[:selected_date][:month],
                                      params[:selected_date][:day])
  end

  def request_valid?
    params[:selected_date].present? &&
    params[:selected_date][:year].present? &&
    params[:selected_date][:month].present? &&
    params[:selected_date][:day].present?
  end
end
