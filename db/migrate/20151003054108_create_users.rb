class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.text :family_info
      t.text :pet_info
      t.string :email
      t.string :phone_number
      t.string :address
      t.text :residence_info
      t.text :about
      t.boolean :active

      t.timestamps
    end
  end
end
