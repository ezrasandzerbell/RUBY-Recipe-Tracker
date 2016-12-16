require('spec_helper')
describe(Ingredient) do
  describe('tests ingredient for properties') do
    ingredient = Ingredient.create({:name => "sugar"})
    recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
    ingredient_id = ingredient.id
    recipe_id = recipe.id
    measurement_test = Measurement.create({:recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
    it('tests for name') do
      expect(ingredient.name).to(eq("sugar"))
    end
    it('tests for cook time of recipe') do
      expect(ingredient.name).to(eq("sugar"))
    end
    it('tests for integration with ingredients step') do
      expect(ingredient.recipes).to(eq([recipe]))
    end
    it('tests for whether each letter in a ingredient string is capitalized') do
      expect(ingredient.name).to(eq('sugar'))
    end
    it('tests to make sure that each name added to an ingredient listing is unique') do
      ingredient1 = Ingredient.create({:name => "sugar"})
      ingredient2 = Ingredient.create({:name => "sugar"})
      expect(Ingredient.all).to(eq([ingredient1]))
    end
  end
end
