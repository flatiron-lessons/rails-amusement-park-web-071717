class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
  	# returns sad when user is more nauseous than happy
  	if self.happiness <= self.nausea
  		"sad"
 	  else # returns happy when the user is  more happy than nauseous
  		"happy"
  	end
  end
end
