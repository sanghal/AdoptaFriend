json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :age, :gender, :family_info, :pet_info, :email, :phone_number, :address, :residence_info, :about, :active
  json.url user_url(user, format: :json)
end
