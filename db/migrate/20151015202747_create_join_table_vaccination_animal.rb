class CreateJoinTableVaccinationAnimal < ActiveRecord::Migration
  def change
    create_join_table :vaccinations, :animals do |t|
      # t.index [:vaccination_id, :animal_id]
      # t.index [:animal_id, :vaccination_id]
    end
  end
end
