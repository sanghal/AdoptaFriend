class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user
        can :update, User do |current_user|
            current_user.id == user.id
        end
        can :update, Animal do |animal|
        	user_animals = user.animals.map(&:id)
        	user_animals.include? animal.id
        end
        can :update, Interest do |interest|
        	user_interests = user.interests.map(&:id)
        	user_interests.include? interest.id
        end

        can :read, User
    	can :read, Animal
    	can :read, Interest
    else
        #afterschool
        #this next line of code does not work; figure out why
        can :read, Animal
        can :read, User

    end
  end
end