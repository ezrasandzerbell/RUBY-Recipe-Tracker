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
  @measurements = Measurement.all
  erb(:ingredients)
end

post('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  @measurements = Measurement.all
  erb(:ingredients)
end

get('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = Step.all
  @measurements = Measurement.all
  erb(:ingredients)
end

post('/recipes/:id/ingredient') do
  ingredient = Ingredient.create({:name => params.fetch("ingredient_name")})
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = Step.all
  @measurements = Measurement.all
  erb(:ingredients)
end

post('/recipes/:id/ingredients') do

  # gather key-values for Measurement Object
  recipe_id = params.fetch("id")
  name = params.fetch("ingredients")
  ingredient = Ingredient.find_by({:name => params.fetch("ingredients")})
  ingredient_id = ingredient.id
  quantity = params.fetch("quantity")
  measurement_type = params.fetch("measurement_type")

  # create measurement object
  Measurement.create({:name => name, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => quantity, :measurement_type => measurement_type})

  recipe = Recipe.find(params.fetch("id"))

  @ingredients = Ingredient.all
  @measurements = Measurement.all
  @recipe = Recipe.find(params.fetch("id"))
  @steps = Step.all
  erb(:ingredients)
end

post('/recipes/:id/steps') do
  step = Step.create({:description => params.fetch("step_description"), :recipe_id => params.fetch("id")})
  step_id = step.id
end
