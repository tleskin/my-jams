require 'rails_helper'

RSpec.describe "user sees tags" do
  context "with valid attributes" do

    it "shows tags for songs" do
      user = User.create(first_name: 'Tom', last_name: 'Leskin', username: 'tleskin', password: 'password', password_confirmation: 'password' )
      user.songs.create(title: 'Cupcakes', artist: 'Ninja')
      label = user.songs.first.tags.create(label: "Disco")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      visit user_path(user)
      # save_and_open_page
      expect(page).to have_content("Playlist:")
      expect(page).to have_content("Cupcakes")
      expect(page).to have_content("Disco")
    end
  end
end
