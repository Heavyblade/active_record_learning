class CreateDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :dependents do |t|
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.references :employee, null: false, foreign_key: true

      t.timestamps null: true
    end
  end
end
