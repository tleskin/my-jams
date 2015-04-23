require 'rails_helper'

RSpec.describe "adding a song to user dashboard" do
  context "with valid attributes" do

  it "allows a user to add song then shows on dashboard" do
    User.create(first_name: "Superman", last_name: "Jones",
            username: "ManOfSteel", password: "password",
            password_confirmation: "password")

    visit login_path

    fill_in "session[username]", with: "ManOfSteel"
    fill_in "session[password]", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, ManOfSteel")

    click_link_or_button "Add Song"
    fill_in "song[title]", with: "Juicy"
    fill_in "song[artist]", with: "Biggie"

    click_link_or_button "Create Song"
    expect(page).to have_content("Juicy")
    end
  end
end
