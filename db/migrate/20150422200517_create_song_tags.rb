class CreateSongTags < ActiveRecord::Migration
  def change
    create_table :song_tag do |t|
      t.references :song, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
