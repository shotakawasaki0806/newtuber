class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :channel_name, :introduction
    validates :channel_url, format: {with: /\A(https:\/\/)(www\.youtube\.com\/(channel\/|user\/))[a-zA-Z0-9\-]{1,}\z/}
    validates :genre_id, numericality: { other_than: 1 }
    PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
    validates_format_of :password, with: PASSWORD_REGEX
  end

  has_many :videos
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
