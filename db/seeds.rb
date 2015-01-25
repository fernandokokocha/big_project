# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Position.create(:name => "GK", :value => 1)
Position.create(:name => "D", :value => 2)
Position.create(:name => "DM", :value => 3)
Position.create(:name => "AM", :value => 4)
Position.create(:name => "S", :value => 5)