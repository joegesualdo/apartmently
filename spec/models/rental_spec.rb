require 'spec_helper'

describe Apartment do
  it {should have_one(:address)}
  it {should have_many(:pictures)}
  it {should validate_presence_of(:price)}
end