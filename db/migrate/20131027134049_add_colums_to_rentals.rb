class AddColumsToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :cats, :boolean
    add_column :rentals, :dogs, :boolean
    add_column :rentals, :beds, :integer
    add_column :rentals, :bathrooms, :integer
  end
end
