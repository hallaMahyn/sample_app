require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation


DatabaseCleaner.clean


  describe "User pages" do
    describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit edit_user_path(user) }

      it "page" do
        expect(page).to have_content("Update your profile")
        expect(page).to have_title("| Edit user")
        expect(page).to have_link('change', href: 'http://gravatar.com/emails')
      end

      it "with invalid information" do
        click_button "Save changes"
        expect(page).to have_content('error')
      end

      describe "pagination" do

              before(:all) { 30.times { FactoryGirl.create(:user) } }
              after(:all)  { User.delete_all }

              it "should list each user" do
                User.paginate(page: 1).each do |user|
                  expect(page).to have_selector('div.pagination')
                  expect(page).to have_selector('li', text: user.name)
                end
              end
            end

    end
  end