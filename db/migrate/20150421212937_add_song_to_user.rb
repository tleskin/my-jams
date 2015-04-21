class AddSongToUser < ActiveRecord::Migration
  def change
    add_column :users, :song_id, :integer
  end
end
