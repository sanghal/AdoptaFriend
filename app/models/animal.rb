class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	has_many :interests
	belongs_to :user
	has_many :vaccinations

	validates_presence_of :user_id
	validates_numericality_of :adoption_fee, only_integer: true, greater_than_or_equal_to: 0

	def self.search(animal, breed, age)
		if (breed != "" && breed != "Other")
			if (age.to_i >= 0)
				if (age.to_i >= 12)
					self.where("breed LIKE ? AND age >= ?", "%#{breed}", age.to_i)
				else
					subage = age.to_i - 3
					self.where("breed LIKE ? AND (age >= ? AND age <= ?)", "%#{breed}%", subage, age.to_i)
				end
			else
				self.where("breed LIKE ?", "%#{breed}%")
			end
		elsif (breed == "Other")
			breed_array = Array.new()
			if(animal == "dog") then breed_array = ["Retriever", "German Sheperd", "Bulldog", "Beagle", "Yorkshire Terrier", "Poodle", "Boxer", "Rottweiler", "Dachshund", "Pointer", "Other"] end
			if(animal == "cat") then breed_array = ["Oriental", "American Shorthair", "Birman", "Sphynx", "Ragdoll", "Siamese", "Abyssinian", "Other"] end
			if(animal == "hamster") then breed_array = ["Syrian", "Dwarf Campbell Russian", "Dwarf Winter White Russian", "Roborovski Dwarf", "Chinese", "Other"] end

			if (age.to_i >= 0)
				if (age.to_i >= 12)
					self.where("breed NOT IN (?) AND age >= ?", breed_array, age.to_i)
				else
					subage = age.to_i - 3
					self.where("breed NOT IN (?) AND (age >= ? AND age <= ?)", breed_array, subage, age.to_i)
				end
			else
				self.where("breed NOT IN (?)", breed_array)
			end
		else
			if (animal != "All")
				breed_array = Array.new()
				if(animal == "dog") then breed_array = ["Retriever", "German Sheperd", "Bulldog", "Beagle", "Yorkshire Terrier", "Poodle", "Boxer", "Rottweiler", "Dachshund", "Pointer", "Other"] end
				if(animal == "cat") then breed_array = ["Oriental", "American Shorthair", "Birman", "Sphynx", "Ragdoll", "Siamese", "Abyssinian"] end
				if(animal == "hamster") then breed_array = ["Syrian", "Dwarf Campbell Russian", "Dwarf Winter White Russian", "Roborovski Dwarf", "Chinese"] end

				if (age.to_i >= 0)
					if (age.to_i >= 12)
						self.where("breed IN (?) AND age >= ?", breed_array, age.to_i)
					else
						subage = age.to_i - 3
						self.where("breed IN (?) AND (age >= ? AND age <= ?)", breed_array, subage, age.to_i)
					end
				else
					self.where("breed IN (?)", breed_array)
				end
			else
				if (age.to_i >= 0)
					if (age.to_i >= 12)
						self.where("age >= ?", age.to_i)
					else
						subage = age.to_i - 3
						self.where("age >= ? AND age <= ?", subage, age.to_i)
					end
				else
					self.all
				end
			end
		end
	end
end
