class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	has_many :interests
	belongs_to :user
	has_and_belongs_to_many :vaccinations

	mount_uploader :photo, PhotoUploader

	validates_presence_of :user_id, :name, :vaccination_ids, :breed, :age
	validates_presence_of :photo

	def self.search(animal, breed, age)
		if (breed != "")
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
		else
			if (animal != "All")
				breed_array = Array.new()
				if(animal == "dog") then breed_array = ["Retriever", "German Sheperd", "Bulldog", "Beagle", "Yorkshire Terrier", "Poodle", "Boxer", "Rottweiler", "Dachshund", "Pointer", "Other"] end
				if(animal == "cat") then breed_array = ["Oriental", "American Shorthair", "Birman", "Sphynx", "Ragdoll", "Siamese", "Abyssinian"] end
			    if(animal == "rabbit") then breed_array = ["Flemish Giant", "Jersey Wooley", "Angoras", "Cinnamon", "Rex Rabbits", "Silver Fox", "Perlfree", "British Giant", "Satin", "Thuringer"] end
			    if(animal == "bird") then breed_array = ["Canary", "Finch", "Cockatiel", "Lovebird", "Parakeet", "Parrot", "Caique", "Lory & Lorikeet", "Conure", "African Grey", "Amazon", "Cockatoo", "Ecletus", "Macaw"] end
			    if(animal == "small") then breed_array = ["Guinea Pig", "Hamster", "Ferrets", "Chinchilla", "Degu", "Gerbil", "Mouse", "Hedgehog"] end
			    if(animal == "reptile") then breed_array = ["Bearded Dragon", "Iguana", "Turtle", "Tortoise", "Snake", "Python", "Gecko", "Lizard", "Chameleon"] end

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
