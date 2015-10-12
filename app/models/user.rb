class User < ActiveRecord::Base

	has_many :animals, through: :interests
	has_many :animals

	has_secure_password

	def self.authenticate(email,password)
    	find_by_email(email).try(:authenticate, password)
  	end

end
