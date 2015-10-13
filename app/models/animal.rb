class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	has_many :interests
	belongs_to :user
	has_many :vaccinations

	def self.search(animal, breed, age)
		if (age.to_i >= 0)
			subage = age.to_i - 3
			self.where("breed LIKE ? AND (age >= ? AND age <= ?)", "%#{breed}%", subage, age.to_i)
		else
			self.where("breed LIKE ?", "%#{breed}%")
		end
	end

end
