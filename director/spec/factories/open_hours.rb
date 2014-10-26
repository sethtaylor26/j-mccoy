FactoryGirl.define do
  factory :open_hour do
    event_id 1
    day_of_the_week 'Monday'
    open_hour '08:00'
    close_hour '16:00'
  end
end
