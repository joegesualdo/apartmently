# == Schema Information
#
# Table name: rentals
#
#  id         :integer          not null, primary key
#  price      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  cats       :boolean
#  dogs       :boolean
#  beds       :integer
#  bathrooms  :integer
#

require 'spec_helper'

describe Rental do
  it {should have_one(:address)}
  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:beds)}
  it {should validate_presence_of(:bathrooms)}
  # True/False validations. Shoulda-matchers error: https://github.com/thoughtbot/shoulda-matchers/issues/179
  it { should allow_value(true).for(:cats)}
  it { should allow_value(false).for(:cats)}
  it { should allow_value(true).for(:dogs)}
  it { should allow_value(false).for(:dogs)}

  it 'should be valid' do
    rental = FactoryGirl.build(:rental)
    expect(rental).to be_valid
  end
  it 'should not be valid' do
    rental = FactoryGirl.build(:rental, price: nil)
    expect(rental).to_not be_valid
  end

  it "should increment the count by 2" do
    expect{FactoryGirl.build(:rental).save}.to change{Rental.count}.by(1)
  end
  #it {should have_many(:pictures)}
end
