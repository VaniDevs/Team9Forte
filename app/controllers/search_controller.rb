class SearchController < ApplicationController
	ZOOM_SCALE = Hash.new({
		"20"=> 1128.497220,
		"19"=> 2256.994440,
		"18"=> 4513.988880,
		"17"=> 9027.977761,
		"16"=> 18055.955520,
		"15"=> 36111.911040,
		"14"=> 72223.822090,
		"13"=> 144447.644200,
		"12"=> 288895.288400,
		"11"=> 577790.576700,
		"10"=> 1155581.153000,
		"9" => 2311162.307000,
		"8" => 4622324.614000,
		"7" => 9244649.227000,
		"6" => 18489298.450000,
		"5" => 36978596.910000,
		"4" => 73957193.820000,
		"3" => 147914387.600000,
		"2" => 295828775.300000,
		"1" => 591657550.500000,
	})
	#http://localhost:3000/search/tasks?lat=49.2639914&long=-123.1043865&zoom=1

	def location
		if lookup_params
      place = Geocoder.search(lookup_params[:term]).collect { |p| p.formatted_address }
    end

    respond_to do |format|
      format.html
      format.json { render :json => place.to_json }
    end
	end

	def tasks
		if coordinate_params
			tasks = Task.all.each do |task|
				debugger
				coordinates = Geocoder.near(task.address, ZOOM_SCALE[coordinate_params[:zoom].to_i]).first.coordinates

				task.lat_long = coordinates
				return task
			end
    end

    respond_to do |format|
      format.html
      format.json { render :json => tasks.to_json }
    end
	end

	def lookup_params
		params.permit(:term)
	end

	def coordinate_params
		params.permit(:lat, :long, :zoom)
	end
end
