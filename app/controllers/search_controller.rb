class SearchController < ApplicationController
	def location
		if lookup_params
      place = Geocoder.search(lookup_params[:term]).collect { |p| p.formatted_address }
    end

    respond_to do |format|
      format.html
      format.json { render :json => place.to_json }
    end
	end

	def lookup_params
		params.permit(:term)
	end
end
