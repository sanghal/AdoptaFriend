json.array!(@animals) do |animal|
  json.extract! animal, :id, :user_id, :date, :name, :breed, :age, :parent_breed, :personality, :adoption_fee, :note
  json.url animal_url(animal, format: :json)
end
