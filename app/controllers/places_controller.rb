class PlacesController < ApplicationController
  def new
  	@place = Place.new
  end

  def create
    # conn = Faraday.new(:url => 'https://www.google.com/recaptcha/api/siteverify')
    # recaptcha_response = conn.post '', { 
      # :secret => ENV['RECAPTCHA_SECRET'],
      # :response => params["g-recaptcha-response"]
    # }
    # if JSON.parse(recaptcha_response.body)['success'] == true
    	@place = current_user.places.new(place_params)
    	if @place.save
    		redirect_to alias_path(@place.alias), success: "Place saved."
    	else
    		redirect_to places_new_path, alert: "There was an error and your place could not be created."
    	end
    # else
      # redirect_to places_new_path, alert: "There was an error with your recaptcha and your place could not be created."
    # end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def show
    if params[:id]
      @place = Place.find(params[:id])
    else
      @place = Place.find_by(:alias => params[:alias])
      # if @place.basic? == true
      #   redirect_to @place.google_url
      # end
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
                                    :parking_notes,
                                    :unit_number,
                                    :main_photo)
    end
end
