FactoryGirl.define do
  factory :event do
    event_type_id 1
    start_time DateTime.now
    end_time DateTime.now + 12.hours
    title 'zombie movie'
    short_review 'was great'
    long_review 'was greatr'
    web_site_url 'http//codepen.io'
    location_lat 40.1
    location_long 50.1
    address '3090 nw colonial dr, bend or 97701'
    spice 100
    cost 10
    recommender_id 1
    image_url 'http//codepen.io/image.png'
    comments 'this is fun'
    general_hours false
  end
end
