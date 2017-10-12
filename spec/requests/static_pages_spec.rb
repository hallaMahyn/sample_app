require 'rails_helper'

describe "Static pages"  do

  describe "Home page", :type => :feature do

    it "should have the content 'Sample App'", type: :feature do
      visit root_path
      expect(page).to have_content('Sample App')
    end

    it "проверяем на наличие правильного ТИТЛА 'HOME'" do
      visit root_path
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')
    end
    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    it "estb li content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "проверяем на наличие правильного ТИТЛА 'HELP'" do
      visit help_path
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')

    end
  end

  describe "About page" do
    it "should have content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "проверяем на наличие правильного ТИТЛА 'ABOUT US'" do
      visit about_path
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')

    end
  end

  describe "Contact page" do

  it "should have a content 'Contact'" do
    visit contact_path
    expect(page).to have_content('Contact')
  end

  it "shuld have a title in page Contact" do
    visit contact_path
    expect(page).to have_title('Ruby on Rails Tutorial Sample App')
  end
end



end