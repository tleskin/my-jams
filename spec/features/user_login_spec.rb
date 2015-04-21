require 'rails_helper'

RSpec.describe "user login" do
  context "with valid credentials" do
    it "shows user dashboard" do
      User.create(first_name: "Superman", last_name: "Jones",
            username: "ManOfSteel", password: "password",
            password_confirmation: "password")

      visit login_path
      fill_in "session[username]", with: "ManOfSteel"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Welcome, ManOfSteel!")
    end
  end
end
