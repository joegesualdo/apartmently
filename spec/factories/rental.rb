# Read about factories at https://github.com/thoughtbot/factory_girl
require 'factory_girl'

FactoryGirl.define do


  # Found solution to testing polymorphic association here: http://stackoverflow.com/questions/9188158/ruby-on-rails-factory-girl-validates-presence-of-and-polymorphic-associations
  # Need to replace 'after_build' with 'after(:create)'. Source: https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

  factory :rental do
    price 100
    beds 2
    bathrooms 3
    cats false
    dogs true
    #after(:create) do |rental|
    #  rental.address = FactoryGirl.create_address(:address)
    #end
  end

  factory :address do
    line1   '300 Broadway'
    city    'Upper West Side'
    state   'New York'
    zipcode '10021'
  end

end