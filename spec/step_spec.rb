require('spec_helper')

describe(Step) do
  describe('tests step for properties') do
    it('tests for description') do
      step1 = Step.create({:description => "Preheat oven at 325 degrees"})
      expect(step1.description).to(eq("Preheat oven at 325 degrees"))
    end
    it('tests the one to many relationship with recipes') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      recipe_id = recipe.id
      step1 = Step.create({:description => "Preheat oven at 325 degrees", :recipe_id => recipe_id})
      step2 = Step.create({:description => "Finely chop onions", :recipe_id => recipe_id})
      expect(step1.recipe).to(eq(recipe))
    end
  end
end
