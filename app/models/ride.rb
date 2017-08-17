class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find(self.user_id)
  	attraction = Attraction.find(self.attraction_id)

  	if user.tickets >= attraction.tickets && user.height >= attraction.min_height
  		user.tickets -= attraction.tickets
  		user.happiness += 4
  		user.nausea += 2
  		user.save
  	elsif user.height >= attraction.min_height
  		"Sorry. You do not have enough tickets to ride the #{attraction.name}."
  	elsif user.tickets >= attraction.tickets
  		"Sorry. You are not tall enough to ride the #{attraction.name}."
  	else
  		"Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
  	end
  end
end
