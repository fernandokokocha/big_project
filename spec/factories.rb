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
end