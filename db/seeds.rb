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

GoalDescription.create(:description => "Y podaje, X wykancza, gol!")
GoalDescription.create(:description => "X strzela gola, podawal Y.")

SoloGoalDescription.create(:description => "X strzela gola po bledzie obroncy.")
SoloGoalDescription.create(:description => "X samotnie przedarl sie przez obrone rywala i gol!")

InjuryDescription.create(:description => "Paskudna kontuzja. X uderzyl glowa w slupek i odpadla mu glowa.")
InjuryDescription.create(:description => "Przeciwnik gra bardzo ostro! X zostaje zniesiony z boiska z powodu kontuzji.")