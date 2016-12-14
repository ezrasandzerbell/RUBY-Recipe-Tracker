class Step < ActiveRecord::Base
  has_many(:step_ingredients)
  has_many(:ingredients, through: :step_ingredients)
end
