# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	user
  	title "Startup of the Year"
  	teaser "It will blow your mind out of the water"
  	description "It has a lot of things that it can do but I wont tell you unless you sign an NDA"
  	goal 20000000
  end
end
