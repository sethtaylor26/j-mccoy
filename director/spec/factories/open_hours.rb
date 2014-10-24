FactoryGirl.define do
  factory :open_hour do
    event_id 1
    day_of_the_week 'Monday'
    open_hour '0800'
    close_hour '1600'
  end
end
