class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_type, :start_time, :end_time, :title, :short_review, :long_review, :web_site_url, :location_lat, :location_long, :address, :spice, :cost, :recommender, :image, :comments, :general_hours, :recommendation_type
end
