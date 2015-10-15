class Vaccination < ActiveRecord::Base

	has_and_belongs_to_many :animals
end
