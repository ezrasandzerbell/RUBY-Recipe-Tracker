require('spec_helper')

describe(Ingredient) do
  describe('tests ingredient for properties') do
    it('tests for name') do
      ingredient = Ingredient.create({:name => "sugar"})
      expect(ingredient.name).to(eq("sugar"))
    end
    it('tests for cook time of recipe') do
      ingredient = Ingredient.create({:name => "sugar"})
      expect(ingredient.name).to(eq("sugar"))
    end
  end
  describe('tests for integration with other tables') do
    it('tests for integration with ingredients step') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      measurement_test = Measurement.create({:recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(ingredient.recipes).to(eq([recipe]))
    end
    it('tests for whether each letter in a ingredient string is capitalized') do
      ingredient1 = Ingredient.create({:name => "sugar"})
      expect(ingredient.name).to(eq('SUGAR'))
    end
    it('tests to make sure that each name added to an ingredient listing is unique') do
      ingredient1 = Ingredient.create({:name => "sugar"})
      ingredient2 = Ingredient.create({:name => "sugar"})
      expect(Ingredient.all).to(eq([ingredient1]))
    end
  end
end
