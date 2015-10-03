json.array!(@vaccinations) do |vaccination|
  json.extract! vaccination, :id, :animal_id, :name, :date
  json.url vaccination_url(vaccination, format: :json)
end
