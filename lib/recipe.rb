class Recipe < ActiveRecord::Base
  has_many(:steps)
  has_many(:ingredients, through: :measurements)
  has_and_belongs_to_many(:tag)
end
