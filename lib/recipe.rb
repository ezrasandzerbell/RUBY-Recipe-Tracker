class Recipe < ActiveRecord::Base
  has_many(:steps)
  has_and_belongs_to_many(:tag)
end
