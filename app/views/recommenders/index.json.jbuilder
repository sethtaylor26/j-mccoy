json.array!(@recommenders) do |recommender|
  json.extract! recommender, :id, :first_name, :last_name, :descr
  json.url recommender_url(recommender, format: :json)
end
