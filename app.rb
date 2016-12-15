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
  @ingredients = recipe.ingredients
  @recipe = recipe
  @steps = recipe.steps
  @measurements = recipe.measurements
  erb(:ingredients)
end

post('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = recipe.ingredients
  @recipe = recipe
  @steps = recipe.steps
  @measurements = recipe.measurements
  erb(:ingredients)
end

get('/recipes/:id') do
  recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @recipe = recipe
  @steps = recipe.steps
  @measurements = recipe.measurements
  erb(:ingredients)
end

post('/recipes/:id/ingredient') do
  ingredient = Ingredient.create({:name => params.fetch("ingredient_name")})
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = @recipe.steps
  @measurements = @recipe.measurements
  erb(:ingredients)
end

post('/recipes/:id/ingredients') do

  recipe = Recipe.find(params.fetch("id"))
  # gather key-values for Measurement Object
  recipe_id = params.fetch("id")
  name = params.fetch("ingredients")
  ingredient = Ingredient.find_by({:name => params.fetch("ingredients")})
  ingredient_id = ingredient.id
  quantity = params.fetch("quantity")
  measurement_type = params.fetch("measurement_type")

  # create measurement object
  Measurement.create({:name => name, :recipe_id => recipe_id, :ingredient_id => ingredient_id, :quantity => quantity, :measurement_type => measurement_type})

  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = @recipe.steps
  @measurements = @recipe.measurements
  erb(:ingredients)
end

get('/recipes/:id/steps') do
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = @recipe.steps
  @measurements = @recipe.measurements
  erb(:steps)
end

post('/recipes/:id/steps') do
  step = Step.create({:description => params.fetch("step_description"), :recipe_id => params.fetch("id")})
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = @recipe.steps
  @measurements = @recipe.measurements
  erb(:steps)
end

get('/recipes/:id/ingredients') do
  @recipe = Recipe.find(params.fetch("id"))
  @ingredients = Ingredient.all
  @steps = @recipe.steps
  @measurements = @recipe.measurements
  erb(:ingredients)
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params.fetch("id"))
  erb(:recipe_edit)
end

post('/recipe/:id') do
  title = params.fetch("recipe_title")
  recipe = Recipe.find(params.fetch("id"))
  recipe.update({:title => title})
  @recipes = Recipe.all
  erb(:index)
end

delete('/') do
  recipe = Recipe.find(params.fetch("recipe_id"))
  recipe.delete()
  @recipes = Recipe.all
  erb(:index)
end
