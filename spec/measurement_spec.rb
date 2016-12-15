require('spec_helper')

describe(Measurement) do
  describe('tests for properties of measurements') do
    it('tests for ingredients') do
      measurement_test = Measurement.create({:name => "beef", :recipe_id => 1, :ingredient_id => 1, :quantity => 4, :measurement_type => "oz"})
      expect(measurement_test.ingredient_id).to(eq(1))
    end
    it('tests for integration with other recipe table') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      name = ingredient.name
      measurement_test = Measurement.create({:name => name, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(measurement_test.recipe).to(eq(recipe))
    end
    it('tests for integration with other ingredient table') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      name = ingredient.name
      measurement_test = Measurement.create({:name => name, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(measurement_test.ingredient).to(eq(ingredient))
    end
    it('tests for name integration with other ingredient table') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      name = ingredient.name
      measurement_test = Measurement.create({:name => name, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(measurement_test.name).to(eq("sugar"))
    end
  end
end
