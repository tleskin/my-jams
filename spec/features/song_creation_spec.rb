require 'rails_helper'

RSpec.describe 'User creates a song' do
  context 'with valid attributes' do
    it 'saves and displays the song title' do
      visit new_song_path
      fill_in "song[title]", with: "Juicy"
      fill_in "song[artist]", with: "Biggie"
      click_link_or_button "Create Song"
      expect(page).to have_content "Juicy"
      expect(page).to have_content "Biggie"
    end
  end
end
