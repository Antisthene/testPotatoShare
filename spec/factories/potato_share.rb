FactoryBot.define do
  factory :potato_share do
    value { 100.0 }
    time_store { 1.day.ago }
  end
end
