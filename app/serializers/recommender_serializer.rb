class RecommenderSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :descr, :created_at, :updated_at
end
