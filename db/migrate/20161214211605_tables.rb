class Tables < ActiveRecord::Migration[5.0]
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end
    create_table(:ingredients_steps) do |t|
      t.column(:quantity, :integer)
      t.column(:measurement_type, :string)
      t.column(:ingredient_id, :integer)
      t.column(:step_id, :integer)
    end
    create_table(:steps) do |t|
      t.column(:recipe_id, :integer)
      t.column(:description, :string)
    end
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:cook_time, :integer)
      t.column(:serving_size, :integer)
    end
    create_table(:recipe_tags) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)
    end
    create_table(:tags) do |t|
      t.column(:type, :string)
    end
  end
end
