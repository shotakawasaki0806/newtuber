class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  validates_format_of :password, with: PASSWORD_REGEX, message:"は半角英数のみで入力してください"
  validates :channel_name, presence: true
  validates :channel_url, format: {with: /\A(https:\/\/)(www\.youtube\.com\/(channel\/|c\/|user\/))[a-zA-Z0-9\-_]{1,}\z/, message:"にはYouTubeチャンネルURLを入力してください" }
  validates :genre_id, presence: true, numericality: { other_than: 1, message:"を選択してください" }
  validates :introduction, presence: true
  
  has_many :videos
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
