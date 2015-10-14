class Interest < ActiveRecord::Base

	belongs_to :animal
	belongs_to :user

	#validate :user_has_one_interest_per_animal, on: :create
	
	private
	def user_has_one_interest_per_animal
		return true if self.user.nil? || self.animal.nil?
		unless Interest.where(animal_id: self.animal_id, user_id: self.user_id).to_a.empty?
			errors.add(:base, "User already showed interest in this animal")
		end
	end
end
