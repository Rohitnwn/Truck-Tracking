class TrackingsController < ApplicationController
	
	def home
	end

	def nearest_trucks(lat, lng)
		trucks = Truck.near(lat, lng)
		trucks_detail = Truck.all.as_json(only: [:id, :applicant, :facility_type, :status, :food_items, :days_hours, :latitude, :longitude])
		render :json => trucks_detail
	end
end
