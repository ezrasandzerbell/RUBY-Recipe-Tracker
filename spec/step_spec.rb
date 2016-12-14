class Step
  has_many(:step_ingredients)
  belongs_to(:recipe)
end
