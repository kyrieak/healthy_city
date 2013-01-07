require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CSV.foreach("db/Hospital_Revised_flatfiles/Hospital_Data.csv") do |row|
# 	loc = Location.create!(Location.params_set(row[2..8]))
# 	hosp = Hospital.create!(Hospital.row_to_params(row))
# 	hosp.location_id = loc.id
# 	hosp.save
# end

  User.create!({ :name => "Ki", :email => "k@k.com", :password => "kk" })

  icon_files = YAML.load_file("db/icon_files.yaml")
  icon_files.values.each do |arr|
    arr.each { |filename| Icon.create!(:filename => filename) }
  end

  Icon.all.collect { |i| i.id }.each do |index|
    Activity.create!({ :user_id => 1, :icon_id => index, :label => "Test #{index}",
      :description => "pink #{index} computer glasses." })
  end