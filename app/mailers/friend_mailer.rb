class FriendMailer < ActionMailer::Base
  default from: "adoptafriend475@gmail.com"
  
  def new_friend_announcement(friend)
    @friend = friend
    mail(:to => friend.email, :subject => "My New Friend") 
  end
  


end