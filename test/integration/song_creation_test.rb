require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
      visit new_song_path
      fill_in "song[title]", with: "Juicy"
      fill_in "song[artist]", with: "Biggie"
      click_link_or_button "Create Song"
      assert page.has_content? "Juicy"
      assert page.has_content? "Biggie"
  end

end
