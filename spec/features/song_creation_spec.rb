require 'rails_helper'

RSpec.describe 'User creates a song' do
  context 'with valid attributes' do
    let(:user) do
      User.create(first_name: "Tom",
                  last_name: "Leskin",
                  username: "tleskin",
                  password: "password",
                  password_confirmation: "password")
    end

    it 'saves and displays the song title' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_song_path
      fill_in "song[title]", with: "Juicy"
      fill_in "song[artist]", with: "Biggie"
      click_link_or_button "Create Song"

      expect(page).to have_content "Juicy"
    end
  end
end
