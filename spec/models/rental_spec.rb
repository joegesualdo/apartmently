require 'spec_helper'

describe Rental do
  it {should have_one(:address)}
  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:beds)}
  it {should validate_presence_of(:bathrooms)}
  it {should validate_presence_of(:dogs)}
  it {should validate_presence_of(:cats)}



  #it {should have_many(:pictures)}
end