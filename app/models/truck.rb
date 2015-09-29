class Truck < ActiveRecord::Base

	def self.populate_trucks_from_csv
		require 'csv'    
		csv_text = File.read('Mobile_Food_Facility_Permit.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  		tr = Truck.new
  		tr.locationid = row["locationid"]
  		tr.applicant = row["Applicant"]
  		tr.facility_type = row["FacilityType"]
  		tr.cnn = row["cnn"]
  		tr.location_description = row["LocationDescription"]
  		tr.address = row["Address"]
  		tr.blocklot = row["blocklot"].to_i
  		tr.block = row["block"].to_i
  		tr.lot = row["lot"].to_i
  		tr.permit = row["permit"]
  		tr.status = row["Status"]
  		tr.food_items = row["FoodItems"]
  		tr.X = row["X"].to_f
  		tr.Y = row["Y"].to_f
  		tr.latitude = row["Latitude"]
  		tr.longitude = row["Longitude"]
  		tr.schedule = row["Schedule"]
  		tr.days_hours = row["dayshours"]
  		tr.noi_sent = row["NOISent"]
  		tr.approved = row["Approved"]
  		tr.received = row["Received"]
  		tr.prior_permit = row["PriorPermit"].to_i
  		tr.location = (tr.latitude.present? and tr.longitude.present?) ? "POINT(#{tr.longitude} #{tr.latitude})" : nil
  		tr.save
		end
	
	end

	def self.near(lat, lng)
		if lat.present? and lng.present?
			# finding nearest five in 5km radius of source
			Truck.find_by_sql("SELECT * FROM (SELECT id, applicant, facility_type, status, food_items, days_hours, latitude, longitude, st_distance_sphere(st_point(#{lng}, #{lat}), st_point(trucks.longitude, trucks.latitude) ) distance FROM trucks ORDER BY distance LIMIT 5) as near_trucks WHERE distance <= 5000")
		else
			[]	
		end	
	end

end
