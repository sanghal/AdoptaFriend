class User < ActiveRecord::Base

	has_many :animals, through: :interests
	has_many :animals
end
