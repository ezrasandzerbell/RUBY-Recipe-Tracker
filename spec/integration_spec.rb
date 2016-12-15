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
end
