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
  describe('creates new step', {:type => :feature}) do
    it('fill out form and submits button') do
      visit('/')
      click_link("Create new recipe")
      fill_in("recipe_title", :with => "fried brainz")
      fill_in("cook_time", :with => "30")
      fill_in("serving_size", :with => "2")
      click_button("Submit")
      fill_in("ingredient_name", :with => "apple")
      click_button("Create")
      select('apple', :from => 'ingredients')
      fill_in("quantity", :with => "3")
      select('grams', :from => 'measurement_type')
      fill_in("step_description", :with => "chop vigorously")
      click_button("Add measurement")
      expect(page).to have_content("chop vigorously")
    end
  end
end
