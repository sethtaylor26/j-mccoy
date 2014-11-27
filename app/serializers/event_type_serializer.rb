class EventTypeSerializer < ActiveModel::Serializer
  attributes :id, :event_type_name, :parent, :image, :created_at, :updated_at
end
