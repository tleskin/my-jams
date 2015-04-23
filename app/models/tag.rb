class Tag < ActiveRecord::Base
  validates :label, presence:true, uniqueness:true
  has_many :song_tags
  has_many :songs, through: :song_tags

end
