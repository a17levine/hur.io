class PlacesController < ApplicationController
  def new
  	@place = Place.new
  end

  def create
  	@place = current_user.places.new(place_params)
  	if @place.save
  		redirect_to current_user
  	else
  		#return an error
  	end
  end

  def edit
  end

  def show
    if params[:id]
      @place = Place.find(params[:id])
    else
      @place = Place.find_by(:alias => params[:alias])
      if @place.basic? == true
        redirect_to @place.google_url
      end
    end  
  end

  def destroy
  end

	private
    def place_params
      params.require(:place).permit(:alias, 
      															:name, 
      															:google_friendly_name, 
      															:formatted_address,
      															:lat,
                                    :long,
      															:notes,
                                    :parking_notes)
    end
end
