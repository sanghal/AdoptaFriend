class CreateVaccinations < ActiveRecord::Migration
  def change
    create_table :vaccinations do |t|
      t.integer :animal_id
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
