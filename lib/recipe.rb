class Recipe < ActiveRecord::Base
  has_many(:steps)
  has_many(:measurements)
  has_many(:ingredients, through: :measurements)
  has_and_belongs_to_many(:tag)
  validates(:title, :presence => true, :uniqueness => {:case_sensitive => false})
  before_save(:title_case)

private
  def title_case
    self.title=(title().titleize())
  end
end
