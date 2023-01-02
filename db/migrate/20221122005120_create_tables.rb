class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :description

      t.timestamps
    end

    create_table :answers do |t|
      t.text :description
      t.belongs_to :question

      t.timestamps
    end
  end

  # without t.referes + polimorphic tag

  # create_table :pictures do |t|
  #   t.string  :name
  #   t.bigint  :imageable_id
  #   t.string  :imageable_type
  #   t.timestamps
  # end

  # add_index :pictures, [:imageable_type, :imageable_id]

  create_table :comments do |t|
    
    t.text :commentable_kinmd
    t.text :text
    t.references :commentable, polymorphic: true
    t.timestamps
  end
end
