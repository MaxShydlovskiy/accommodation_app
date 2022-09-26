class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :hotel_type
      t.string :address
      t.string :city
      t.integer :rooms
      t.string :surroundings

      t.timestamps
    end
  end
end
