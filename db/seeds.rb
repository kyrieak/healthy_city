require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	CSV.foreach("db/Hospital_Revised_flatfiles/Hospital_Data.csv") do |row|
		loc = Location.create!(Location.params_set(row[2..8]))
		hosp = Hospital.create!(Hospital.row_to_params(row))
		hosp.location_id = loc.id
		hosp.save
	end
