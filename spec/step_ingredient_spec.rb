require('spec_helper')

describe(StepIngredient) do
  describe('tests for properties of step ingredients') do
    it('tests for ingredients') do
      step_ingredient_test = StepIngredient.create({:step_id => 1, :ingredient_id => 1, :quantity => 4, :measurement_type => "oz"})
      expect(step_ingredient_test.ingredient_id).to(eq(1))
    end
  end
end
