class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
	end

	def edit
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def new
		@attraction = Attraction.new(params[:id])
	end

	def create
		@attraction = Attraction.create(attraction_params)
		
		redirect_to attraction_path(@attraction)
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		@attraction.save
		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
	end
end