class Animal < ActiveRecord::Base

	has_many :users, through: :interests
	belongs_to :user
	has_many :vaccination

end
