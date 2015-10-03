class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :user_id
      t.date :date
      t.string :name
      t.string :breed
      t.integer :age
      t.string :parent_breed
      t.text :personality
      t.string :adoption_fee
      t.text :note

      t.timestamps
    end
  end
end
