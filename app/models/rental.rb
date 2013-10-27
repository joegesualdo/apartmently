class Rental < ActiveRecord::Base

  has_one :address, as: :addressable

  validates_presence_of :price,
                        :cats,
                        :dogs,
                        :beds,
                        :bathrooms

end
