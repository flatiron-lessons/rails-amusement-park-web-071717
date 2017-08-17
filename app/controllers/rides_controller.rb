class RidesController < ApplicationController

	def index
		@rides = Ride.all
	end

	def edit
		binding.pry
	end

	def create
		@attraction = Attraction.find(params[:ride][:attraction_id])
		@ride = Ride.create(attraction: @attraction, user: current_user)
		flash[:message] = @ride.take_ride

		redirect_to user_path(current_user)
	end

	def new
	end

end