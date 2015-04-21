class Song < ActiveRecord::Base
  validates :title, :artist, presence: true
  has_many :users
end
