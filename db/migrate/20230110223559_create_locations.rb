class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :postal_code
      t.string :city
      t.string :state_province
      t.references :country, null: false, foreign_key: true

      t.timestamps null: true
    end
  end
end
