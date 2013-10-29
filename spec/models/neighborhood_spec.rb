require 'spec_helper'

describe Neighborhood do
  it {should respond_to(:name)}
  it {should respond_to(:description)}

  it {should have_many(:rentals)}
end