require('spec_helper')

describe(IngredientsStep) do
  describe('tests for properties of step ingredients') do
    it('tests for ingredients') do
      step_ingredient_test = IngredientsStep.create({:step_id => 1, :ingredient_id => 1, :quantity => 4, :measurement_type => "oz"})
      expect(step_ingredient_test.ingredient_id).to(eq(1))
    end
    it('tests for integration with other step table') do
      step = Step.create({:description => "Preheat oven at 325 degrees"})
      step_id = step.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      step_ingredient_test = IngredientsStep.create({:step_id => step_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(step_ingredient_test.step).to(eq(step))
    end
    it('tests for integration with other ingredient table') do
      step = Step.create({:description => "Preheat oven at 325 degrees"})
      step_id = step.id
      ingredient = Ingredient.create({:name => "sugar"})
      ingredient_id = ingredient.id
      step_ingredient_test = IngredientsStep.create({:step_id => step_id, :ingredient_id => ingredient_id, :quantity => 4, :measurement_type => "oz"})
      expect(step_ingredient_test.ingredient).to(eq(ingredient))
    end
  end
end
