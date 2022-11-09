class Api::V1::ApplicationController < ActionController::API
  PAGE_SIZE = 20

  private

  def page_offset
    params[:page_offset] || 0
  end

  def page_size
    params[:page_size] || PAGE_SIZE
  end

  def pagination_data
    {
      page_offset: page_offset,
      page_size: page_size
    }
  end
end
