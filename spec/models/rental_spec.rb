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

  let(:rental){FactoryGirl.build(:rental)}
  let(:address){ {line1: "544 Washington ave", city: "Wayne", state: "NJ", zipcode: '07758'} } # TODO: how to store has in FG?

  # Associations
  context "Associations" do
    it { should have_one(:address)}
    xit{ should have_many(:features)}
    xit{ should have_one(:neighborhood)}
  end

  context 'model attributes' do
    it { should respond_to :price }
    it { should respond_to :cats }
    it { should respond_to :dogs }
    it { should respond_to :beds }
    it { should respond_to :bathrooms }
    it { should respond_to :available? }
    it { should respond_to :date_available }
  end

  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:beds)}
  it {should validate_presence_of(:bathrooms)}
  # True/False validations. Shoulda-matchers error: https://github.com/thoughtbot/shoulda-matchers/issues/179
  it { should allow_value(true).for(:cats)}
  it { should allow_value(false).for(:cats)}
  it { should allow_value(true).for(:dogs)}
  it { should allow_value(false).for(:dogs)}

  context "zipcode" do
    it 'has to be valid 5 numbers'
    it 'cannot be letters'
    it 'must be US zipcode'
  end
  it 'has valid price'

  it 'factory should be valid' do
    expect(rental).to be_valid
  end

  it "should successfully be created" do
    expect{rental.save}.to change{Rental.count}.by(1)
  end

  it "should have correct beds" do
    rental = Rental.create({price: 22, cats: true, dogs: false, beds: 2, bathrooms: 3})
    expect(rental.beds).to eq 2
  end

  it "#destroy" do
    rental.save
    rental.destroy
    expect(Rental.count).to eq 0
  end
  it "should take address" do
    rental.create_address(address)
    expect(rental.address.city ).to eq 'Wayne'
  end

end
