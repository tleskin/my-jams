class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  belongs_to :user
  has_many :song_tags
  has_many :tags, through: :song_tags
end
