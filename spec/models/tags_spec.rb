require 'rails_helper'

RSpec.describe "tags"do
  context "tags table" do
    let(:tag){Tag.create(label: "Disco")}

    it 'is valid' do
      expect(tag).to be_valid
    end

    it 'is invalid without a label' do
      tag.label = nil
      expect(tag).to_not be_valid
    end

    it 'cannot have duplicates' do
      expect(tag).to be_valid
      tag2 = Tag.create(label: "Disco")
      expect(tag2).to_not be_valid
    end
  end
end
