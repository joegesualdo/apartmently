class Address < ActiveRecord::Base

  belongs_to :addressable, polymorphic: true

  validates_presence_of :line1,
                        :city,
                        :state,
                        :zipcode

end
