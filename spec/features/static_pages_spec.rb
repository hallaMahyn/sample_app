require 'rails_helper'

describe "Static pages"  do

  describe "Home page", :type => :feature do
    before { visit root_path }
    it "should have the content 'Sample App'", type: :feature do
      expect(page).to have_content('Sample App')
    end

    it "проверяем на наличие правильного ТИТЛА 'HOME'" do
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')
    end
    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    before { visit help_path }
    it "estb li content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "проверяем на наличие правильного ТИТЛА 'HELP'" do
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')

    end
  end

  describe "About page" do
    before { visit about_path }
    it "should have content 'About Us'" do
      expect(page).to have_content('About Us')
    end

    it "проверяем на наличие правильного ТИТЛА 'ABOUT US'" do
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')

    end
  end

  describe "Contact page" do
    before { visit contact_path }

  it "should have a content 'Contact'" do
    expect(page).to have_content('Contact')
  end

  it "shuld have a title in page Contact" do
    expect(page).to have_title('Ruby on Rails Tutorial Sample App')
  end
end



end