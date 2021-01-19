class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :video_name, :overview
    validates :video_url, format: {with: /\A(https:\/\/)(www.youtube.com\/watch\?v=|youtu\.be\/)+[\S]{11}\z/}
    validates :genre_id, numericality: { other_than: 1 }
  end
end
