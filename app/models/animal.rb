class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	belongs_to :user
	has_many :vaccination

	def self.search(search)
		self.where("breed like ?", "%#{search}%")
	end

end
