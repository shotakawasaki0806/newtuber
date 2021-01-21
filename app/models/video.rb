class Video < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :video_name, presence: true
  validates :video_url, format: {with: /\A(https:\/\/)(www.youtube.com\/watch\?v=|youtu\.be\/)+[a-zA-Z0-9\-_]{11}\z/}
  validates :overview, presence: true
  validates :genre_id, presence: true, numericality: { other_than: 1 }
end
