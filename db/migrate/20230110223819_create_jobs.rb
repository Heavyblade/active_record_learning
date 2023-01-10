class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :min_salary
      t.integer :max_salary

      t.timestamps null: true
    end
  end
end
