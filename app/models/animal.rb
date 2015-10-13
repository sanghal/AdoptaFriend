class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	has_many :interests
	belongs_to :user
	has_many :vaccinations

end
