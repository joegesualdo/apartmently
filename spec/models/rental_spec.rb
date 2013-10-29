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

  context "with valid credentials" do
    before :each do
      @rental = FactoryGirl.build(:rental)
      #Must find a way to store address in FactoryGirl. Can't do it currently because we need to pass as hash into create
                                                                                                        # address
      address = {line1: "544 Washington ave", city: "Wayne", state: "NJ", zipcode: '07758'}
      @rental.create_address(address)
    end

    it 'factory should be valid' do
      expect(@rental).to be_valid
    end

    it "should successfully be created" do
      expect{@rental.save}.to change{Rental.count}.by(1)
    end

    it "should have correct beds" do
      rental = Rental.create({price: 22, cats: true, dogs: false, beds: 2, bathrooms: 3})
      expect(rental.beds).to eq 2
    end

    it "#destroy" do
      @rental.save
      @rental.destroy
      expect(Rental.count).to eq 0
    end
    it "should have correct address" do
      expect(@rental.address.city ).to eq 'Wayne'
    end
  end
end
