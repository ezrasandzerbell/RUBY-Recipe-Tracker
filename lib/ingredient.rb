class Ingredient < ActiveRecord::Base
  has_many(:measurements)
  has_many(:recipes, through: :measurements)
  before_save(:upcased_name)


private

  define_method(:upcased_name) do
    self.name=(name().upcase())
  end
end
