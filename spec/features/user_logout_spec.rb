require 'rails_helper'

RSpec.describe "user logout" do
  context "when previously logged in" do

  it "logs out" do
    User.create(first_name: "Superman", last_name: "Jones",
            username: "ManOfSteel", password: "password",
            password_confirmation: "password")

    visit login_path

    fill_in "session[username]", with: "ManOfSteel"
    fill_in "session[password]", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, ManOfSteel")
    click_link_or_button "Logout"
    expect(page).to have_content("Successfully logged out.")
    end
  end
end
