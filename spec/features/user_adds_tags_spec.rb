require 'rails_helper'


RSpec.describe "user adds tag" do

  context "with valid attributes" do
    let(:user) {User.create(first_name: 'Tom',
                            last_name: 'Leskin',
                            username: 'tleskin',
                            password: 'password',
                            password_confirmation: 'password' )}

    it "can add a tag" do
      user.songs.create(title: 'Cupcakes', artist: 'Ninja')
      label = user.songs.first.tags.create(label: "Jazz")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_song_path

      fill_in "song[title]", with: "This Song"
      fill_in "song[artist]", with: "Superman"
      page.click ""
      click_link_or_button "Create Song"

      expect(page).to have_content "This Song"
      expect(page).to have_content "Jazz"






    end
  end

end
