# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  line1            :string(255)
#  line2            :string(255)
#  city             :string(255)
#  state            :string(255)
#  zipcode          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  addressable_id   :integer
#  addressable_type :string(255)
#

require 'spec_helper'

describe Address do

  let(:address) { FactoryGirl.create(:address) }

  context "test spec" do
    it 'created a factory' do
      expect(FactoryGirl.create(:address)).to be_valid
    end
  end

  context 'table columns' do
    it { expect(address).to respond_to :line1 }
    it { expect(address).to respond_to :line2 }
    it { expect(address).to respond_to :city }
    it { expect(address).to respond_to :state }
    it { expect(address).to respond_to :zipcode }
    it { expect(address).to respond_to :addressable_id }
    it { expect(address).to respond_to :addressable_type }
    it { expect(address).to_not respond_to :fake_column }
  end

  context 'associations' do
    it { should belong_to :addressable }
  end

  context 'validations' do
    it { should validate_presence_of :line1 }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :addressable_id }
    it { should validate_presence_of :addressable_type  }
  end

  describe 'zipcode' do
    context 'doesnt save when' do
      it 'has 6 numbers' do
        address.zipcode = '012345'
        address.save
        expect(address.errors[:zipcode]).to_not be_empty
      end
      it 'has 4 numbers' do
        address.zipcode = '0123'
        address.save
        expect(address.errors[:zipcode]).to_not be_empty
      end
      it 'has letters' do
        address.zipcode = 'abddd'
        address.save
        expect(address.errors[:zipcode]).to_not be_empty
      end
    end
  end
  it 'catches valid zipcode' do
    address.zipcode = '12345'
    address.save
    expect(address.errors[:zipcode]).to be_empty
  end

  it 'catches invalid zipcode' do
    address.zipcode = '012345'
    address.save
    expect(address.errors[:zipcode]).to_not be_empty
  end
end
