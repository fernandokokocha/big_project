FactoryGirl.define do  factory :league do
    name "MyString"
win_points 1
draw_points 1
win_price 1
draw_price 1
top_scorer_price 1
best_assistant_price 1
  end

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
end