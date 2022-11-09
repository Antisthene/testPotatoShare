class PotatoShare < ApplicationRecord
  validates :value, presence: true
  validates :store_time, presence: true

  scope :yesterday, -> { where(store_time: 1.day.ago.utc.beginning_of_day..1.day.ago.utc.end_of_day) }
  scope :at_date, ->(year, month, day) { where(store_time: Time.new(year, month, day).beginning_of_day..Time.new(year, month, day).end_of_day) }
end
