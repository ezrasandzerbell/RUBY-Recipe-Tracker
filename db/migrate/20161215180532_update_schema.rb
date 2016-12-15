class UpdateSchema < ActiveRecord::Migration[5.0]
  def change
    drop_table(:ingredients_steps)
    create_table(:measurements) do |t|
      t.column(:recipe_id, :integer)
      t.column(:ingredient_id, :integer)
      t.column(:quantity, :integer)
      t.column(:measurement_type, :string)
    end
  end
end
