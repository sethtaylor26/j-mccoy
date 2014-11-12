json.array!(@open_hours) do |open_hour|
  json.extract! open_hour, :id, :event_id, :day_of_the_week, :open_hour, :close_hour
  json.url open_hour_url(open_hour, format: :json)
end
