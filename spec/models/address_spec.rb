require 'spec_helper'

describe Address do
  it{should validate_presence_of(:line1)}
  it{should validate_presence_of(:city)}
  it{should validate_presence_of(:state)}
  it{should validate_presence_of(:zipcode)}
end