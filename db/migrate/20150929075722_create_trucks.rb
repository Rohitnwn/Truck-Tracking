class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
    	t.integer :locationid
    	t.string :applicant
    	t.string :facility_type 
    	t.integer :cnn, limit: 6
    	t.text :location_description
    	t.text :address
    	t.integer :blocklot, limit: 6
    	t.integer :block
    	t.integer :lot
    	t.string :permit
    	t.string :status 
    	t.text :food_items
    	t.float :X
    	t.float :Y
    	t.float :latitude
    	t.float :longitude
    	t.string :schedule
    	t.string :days_hours
    	t.string :noi_sent
    	t.string :approved
    	t.string :received
    	t.integer :prior_permit
    	t.string :expiration_time
    	t.spatial  "location", limit: {:srid=>4326, :type=>"point"}
      t.timestamps
    end
  end
end
