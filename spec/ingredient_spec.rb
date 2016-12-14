require('spec_helper')

describe(Ingredient) do
  describe('tests ingredient for properties') do
    it('tests for name') do
      ingredient = Ingredient.create({:name => "sugar"})
      expect(ingredient.name).to(eq("sugar"))
    end
  end
end
