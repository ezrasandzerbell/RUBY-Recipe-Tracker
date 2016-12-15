require('spec_helper')

describe('navigation') do
  describe('navigates successfully to second page', {:type => :feature}) do
    it('navigates to first page') do
      visit('/')
      expect(page).to have_content("Hell's Kitchen")
    end
    it('navigates to first page') do
      visit('/')
      click_link("Create new recipe")
      expect(page).to have_content("Hell's Kitchen")
    end
  end
  describe('creates a new recipe', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      expect(page).to have_content("fried brainz")
    end
  end
  describe('creates new ingredients', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      fill_in("ingredient_name", :with => "oil")
      click_button("Create")
      expect(page).to have_content("oil")
    end
  end
end
describe('navigation') do
  describe('creates new measurement', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      fill_in("ingredient_name", :with => "garlic extract")
      click_button("Create")
      select('garlic extract', :from => 'ingredients')
      fill_in("quantity", :with => "1")
      select('teaspoon', :from => 'measurement_type')
      click_button("Add measurement")
      expect(page).to have_content("garlic extract: 1 teaspoon")
    end
  end
end
describe('navigation') do
  describe('creates new step', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      fill_in("ingredient_name", :with => "salt")
      click_button("Create")
      select('salt', :from => 'ingredients')
      fill_in("quantity", :with => "1")
      select('teaspoon', :from => 'measurement_type')
      click_button("Add measurement")
      click_link("Finished Adding Ingredients: Begin Creating Recipe Steps")
      fill_in('step_description', :with => "mix garlic extract with salt")
      click_button("Add")
      expect(page).to have_content("mix garlic extract with salt")
    end
  end
end
describe('navigation') do
  describe('navigates to home page from', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      fill_in("ingredient_name", :with => "beets")
      click_button("Create")
      select('beets', :from => 'ingredients')
      fill_in("quantity", :with => "1")
      select('teaspoon', :from => 'measurement_type')
      click_button("Add measurement")
      click_link("Finished Adding Ingredients: Begin Creating Recipe Steps")
      fill_in('step_description', :with => "chop beets")
      click_button("Add")
      click_link("Add new ingredients")
      expect(page).to have_content("Creation Station")
    end
  end
end
