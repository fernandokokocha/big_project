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

GoalDescription.create(:description => "Y podaje, X wykańcza, gol!")
GoalDescription.create(:description => "X strzela gola, podawał Y.")

SoloGoalDescription.create(:description => "X strzela gola po błędzie obrońcy.")
SoloGoalDescription.create(:description => "X samotnie przedarł sie przez obronę rywala i gol!")

InjuryDescription.create(:description => "Paskudna kontuzja. X uderzył głową w słupek i odpadła mu głowa.")
InjuryDescription.create(:description => "Przeciwnik gra bardzo ostro! X zostaje zniesiony z boiska z powodu kontuzji.")

YellowCardDescription.create(:description => "X dostaje żółtą kartkę za ostry wślizg.")
YellowCardDescription.create(:description => "X dostaje żółtą kartkę za dyskusje z sędziami.")
YellowCardDescription.create(:description => "X dostaje żółtą kartkę za zagranie ręką.")

DoubleYellowCardDescription.create(:description => "X dostaje żółtą kartkę za zagranie ręką, a ponieważ miał już jedną na koncie - wylatuje z boiska!")
DoubleYellowCardDescription.create(:description => "X fauluje rywala i dostaje drugą żółtą kartkę w meczu!")
DoubleYellowCardDescription.create(:description => "X opóźnia grę i kończy się to dla niego fatalnie - drugą żółtą kartką.")

RedCardDescription.create(:description => "X brutalnie fauluje rywala bez piłki - czerwona kartka.")
RedCardDescription.create(:description => "X bezczelnie łapie piłkę w ręce - czerwona kartka!")