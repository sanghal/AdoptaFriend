class Interest < ActiveRecord::Base

	belongs_to :animal
	belongs_to :user

	validate :user_has_one_interest_per_animal, on: :create
	validate :user_cannot_show_interest_to_himself, on: :create

	private
	def user_has_one_interest_per_animal
		return true if self.user.nil? || self.animal.nil?
		unless Interest.where(animal_id: self.animal_id, user_id: self.user_id).to_a.empty?
			errors.add(:base, "You already showed interest in this animal")
		end
	end

	def user_cannot_show_interest_to_himself
		if (self.animal.user_id == self.user_id)
			errors.add(:base, "You cannot show interest to his/her own animal!")
		end
	end
end
