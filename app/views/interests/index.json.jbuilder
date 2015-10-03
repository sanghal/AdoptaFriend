json.array!(@interests) do |interest|
  json.extract! interest, :id, :user_id, :animal_id, :date
  json.url interest_url(interest, format: :json)
end
