class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.belongs_to :region, foreign_key: true

      t.timestamps null: true
    end
  end
end
