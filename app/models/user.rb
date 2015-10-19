class User < ActiveRecord::Base
	has_many :interests
	has_many :animals

	mount_uploader :photo, PhotoUploader
	has_secure_password

	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates_presence_of :first_name, :last_name, :phone_number, :age, :gender
	validates_presence_of :password, on: :create 
	validates_presence_of :password_confirmation, on: :create 
	validates_confirmation_of :password, message: "does not match"
	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov))\z/i, message: "is not a valid format"

	# scopes
	scope :alphabetical, -> { order('last_name, first_name') }
	scope :active, -> { where(active: true) }
	scope :inactive, -> { where(active: false) }

	def self.authenticate(email,password)
    	find_by_email(email).try(:authenticate, password)
  	end

  	def proper_name
  		first_name + " " + last_name
  	end

end
