class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.date :hire_date
      t.references :job, null: false, foreign_key: true
      t.integer :salary
      t.references :department, null: false, foreign_key: true
      t.integer :manager_id

      t.timestamps null: true
    end
  end
end
