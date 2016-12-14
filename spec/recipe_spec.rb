require('spec_helper')

describe(Recipe) do
  describe('tests for recipe properties') do
    it('tests for name of recipe') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      expect(recipe.title).to(eq("Filet Mignon"))
    end
    it('tests for cook time of recipe') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      expect(recipe.cook_time).to(eq(45))
    end
  end
  describe('tests for integration with other tables') do
    it('tests for integration with ingredients step') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      step = Step.create({:description => "Preheat oven at 325 degrees", :recipe_id => recipe_id})
      step_id = step.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      step_ingredient_test = IngredientsStep.create({:step_id => step_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(recipe.steps).to(eq([step]))
    end
  end
end
