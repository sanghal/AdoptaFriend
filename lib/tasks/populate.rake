namespace :db do 
	desc "Erase and fill database"
	# creating a rake task within db namespace called 'populate'
  	# executing 'rake db:populate' will cause this script to run
  	task :populate => :environment do
  		# Drop the old db and recreate from scratch
	    Rake::Task['db:drop'].invoke
	    Rake::Task['db:create'].invoke
	    # Invoke rake db:migrate
	    Rake::Task['db:migrate'].invoke
	    Rake::Task['db:test:prepare'].invoke
	    # Need gem to make this work when adding students later: faker
	    # Docs at: http://faker.rubyforge.org/rdoc/
	    require 'faker'
	    require 'factory_girl_rails'

	    # Step 1: Create some users 

	    MLV = FactoryGirl.create(:vaccination, name: "Canine Distemper (MLV)")
	    Hepetitis = FactoryGirl.create(:vaccination, name: "Hepetitis")
	    Leptosporosis = FactoryGirl.create(:vaccination, name: "Leptosporosis")
	    Parainfluenza = FactoryGirl.create(:vaccination, name: "Parainfluenza ")
	    Rabies = FactoryGirl.create(:vaccination, name: "Rabies")
	    Leukemia = FactoryGirl.create(:vaccination, name: "Leukemia")
	    Deworming = FactoryGirl.create(:vaccination, name: "Deworming ")
	    CanineFlu = FactoryGirl.create(:vaccination, name: "Canine Flu")


	end
end
