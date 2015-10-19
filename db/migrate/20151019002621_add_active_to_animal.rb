class AddActiveToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :active, :boolean
  end
end
