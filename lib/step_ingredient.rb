class StepIngredient < ActiveRecord::Base
  has_many(:ingredients)
  belongs_to(:step)
end
