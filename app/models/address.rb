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

class Address < ActiveRecord::Base

  belongs_to :addressable, polymorphic: true

  validates_presence_of :line1,
                        :city,
                        :state,
                        :zipcode

end
