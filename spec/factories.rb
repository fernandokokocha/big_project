FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password 'password'
    admin false
  end

  factory :admin, class: User do
    email
    password 'password'
    admin true
  end

  factory :stadium do
    name 'Arena'
    capacity 1000
    roof false
  end

  factory :tactic do
  end

  factory :team do
    name 'Team'
    stadium
    user
    tactic
  end

  factory :match do
    association :home, factory: :team, name: 'Home Team'
    association :away, factory: :team, name: 'Away Team'
    home_score 0
    away_score 0
  end

  factory :position do
    name 'GK'
  end
  
  factory :player do
    first_name 'First'
    last_name 'Last'
    handling 1
    reflex 2
    discipline 3
    tackling 4
    work_rate 5
    positioning 6
    creativity 7
    technique 8
    instinct 9
    shots 10
    condition 10
    birthdate { Date.today - 21.years }
    position
  end

  factory :match_event do
    event_type 'goal'
    association :first_player, factory: :player
    association :second_player, factory: :player
  end
end