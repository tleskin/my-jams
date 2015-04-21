require 'rails_helper'

RSpec.describe "user account creation" do
  context "with valid attributes" do
    it "creates an account" do
      visit new_user_path

      fill_in "First name", with: "Bob"
      fill_in "Last name", with: "Jones"

      fill_in "Username", with: "bjones"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"
      expect(page).to have_content("Welcome, bjones!")
    end
  end
end
