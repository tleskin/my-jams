require 'rails_helper'

RSpec.describe "admin tags" do
  context "with admin login" do
    let(:admin) do
      User.create( first_name: "Tom",
                   last_name: "Leskin",
                   username: "tleskin",
                   password: "password",
                   password_confirmation: "password",
                   role: 1
                   )

    end

    it "displays the tags" do
      Tag.create(label: "Disco")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_tags_path

      expect(page).to have_content("Tags")


      expect(page).to have_content("Disco")
    end
  end
end
