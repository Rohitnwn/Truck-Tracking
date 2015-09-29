class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
    	t.integer :locationid
    	t.string :applicant
    	t.integer :facility_type  #enum
    	t.integer :cnn, limit: 6
    	t.text :location_description
    	t.text :address
    	t.integer :blocklot, limit: 6
    	t.integer :block
    	t.integer :lot
    	t.string :permit
    	t.integer :status #enum
    	t.text :food_items
    	t.float :X
    	t.float :Y
    	t.float :latitude
    	t.float :longitude
    	t.string :schedule
    	t.string :days_hours
    	t.string :noi_sent
    	t.datetime :approved
    	t.datetime :received
    	t.integer :prior_permit
    	t.datetime :expiration_time
    	# t.st_point :location, geographic: true
      t.timestamps
    end
  end
end
