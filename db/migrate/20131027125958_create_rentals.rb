class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :price

      t.timestamps
    end
  end
end
