json.array!(@recommendation_types) do |recommendation_type|
  json.extract! recommendation_type, :id, :rec_type, :descr
  json.url recommendation_type_url(recommendation_type, format: :json)
end
