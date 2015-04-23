class SongTag < ActiveRecord::Base
  belongs_to :song
  belongs_to :tag
  validates :song_id, :tag_id, presence: true
end
