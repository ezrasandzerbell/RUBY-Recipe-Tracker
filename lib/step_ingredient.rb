class Step_ingredient
  has_many(:ingredients)
  belongs_to(:step)
end
