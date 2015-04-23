class RenameSongtagtoSongtags < ActiveRecord::Migration
  def change
    rename_table :song_tag, :song_tags
  end
end
