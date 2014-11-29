class OpenHourSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :day_of_the_week, :open_hour, :close_hour
end
