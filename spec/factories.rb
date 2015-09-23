FactoryGirl.define do
	factory :account do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end

  factory :user do
  	email { Faker::Internet.email }
  	encrypted_password "$2a$10$BcgADiGLA5jzdj43nGdxo.nWREBlzjFDloaUXeB199QZJt1LFTlvG"
  	password "password"
    password_confirmation "password"
  end

  factory :page do
    name "Example Page"
    slug "example-page"
  end
end