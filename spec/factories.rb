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
end