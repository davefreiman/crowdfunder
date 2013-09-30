# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Jim"
  	last_name "Brown"
  	sequence(:email) {|n| "jimbrown#{n}@clevelandbrowns.com"}
  	password "password"
  end
end
