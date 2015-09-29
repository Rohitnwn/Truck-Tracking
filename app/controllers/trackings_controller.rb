class TrackingsController < ApplicationController
  def home
  end

  def nearest_trucks
    trucks_details = Truck.near(params[:lat], params[:lng])
    render :json => trucks_details.as_json
  end
end
