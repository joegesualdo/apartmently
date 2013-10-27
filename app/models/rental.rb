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

class Rental < ActiveRecord::Base

  has_one :address, as: :addressable

  validates :price,
            :beds,
            :bathrooms,
            presence: true
  validates :cats,
            :dogs,
            inclusion: { in: [true, false] }

end
