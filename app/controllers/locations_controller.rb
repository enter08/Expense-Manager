class LocationsController < ApplicationController

	def index
	  @locations = Location.order('name').
      finder(params[:q]).page(params[:page]).per_page(10)
      respond_to do |format|
	      format.html
	      format.json { render json: @locations }
      end
	end
end