class Truck < ActiveRecord::Base
  def self.near(lat, lng)
    if lat.present? and lng.present?
      # finding nearest five in of source
      trucks = Truck.find_by_sql("SELECT id, applicant, facility_type, status, food_items, days_hours, latitude, longitude, st_distance_sphere(st_point(#{lng}, #{lat}), st_point(trucks.longitude, trucks.latitude) ) distance FROM trucks ORDER BY distance LIMIT 5")
      #Taking trucks only inside 5km radius
      trucks.select { |tr| tr.distance <= 5000 }
    else
      []	
    end	
  end
end
