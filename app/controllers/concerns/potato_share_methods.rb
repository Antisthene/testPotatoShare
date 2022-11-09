module PotatoShareMethods

  def request_valid?
    params[:selected_date].present? &&
    params[:selected_date][:year].present? &&
    params[:selected_date][:month].present? &&
    params[:selected_date][:day].present?
  end
end
