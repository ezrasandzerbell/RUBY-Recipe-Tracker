require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/')do
  @recipes = Recipe.all
  erb(:index)
end

get('/recipe') do
  erb(:recipe_create)
end

post('/recipes') do
  recipe = Recipe.create(:title => params.fetch("recipe_title"), :cook_time => params.fetch("cook_time"), :serving_size => params.fetch("serving_size"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  erb(:recipe_steps)
end

post('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  erb(:recipe_steps)
end

get('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  erb(:recipe_steps)
end

post('/recipes/:id/ingredient') do
  ingredient = Ingredient.create({:name => params.fetch("ingredient_name")})
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  erb(:recipe_steps)
end

post('/recipes/:id/step') do

  @ingredients = Ingredient.all

  step = Step.create({:description => params.fetch("step_description"), :recipe_id => params.fetch("id")})
  step_id = step.id

  ingredient = Ingredient.find_by({:name => params.fetch("ingredients")})
  ingredient_id = ingredient.id

  quantity = params.fetch("quantity")
  measurement_type = params.fetch("measurement_type")

  IngredientsStep.create({:step_id => step_id, :ingredient_id => ingredient_id, :quantity => quantity, :measurement_type => measurement_type})

  recipe = Recipe.find(params.fetch("id"))
  @ingredients_step = IngredientsStep.all
  @recipe = recipe
  @steps = Step.all
  erb(:recipe_steps)
end
