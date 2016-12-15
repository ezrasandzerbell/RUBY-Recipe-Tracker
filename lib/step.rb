class Step < ActiveRecord::Base
  has_many(:step_ingredients)
end
