require('spec_helper')

describe(Recipe) do
  describe('tests for recipe properties') do
    it('tests for name of recipe') do
      recipe = Recipe.create({:title => "Filet Mignon", :cook_time => 45, :serving_size => 5})
      expect(recipe.title).to(eq("Filet Mignon"))
    end
  end
end
