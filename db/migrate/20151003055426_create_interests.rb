class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :animal_id
      t.date :date

      t.timestamps
    end
  end
end
