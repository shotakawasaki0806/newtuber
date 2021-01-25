class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :google_oauth2]
  
  validates :channel_name, presence: true
  validates :channel_url, format: {with: /\A(https:\/\/)(www\.youtube\.com\/(channel\/|c\/|user\/))[a-zA-Z0-9\-_]{1,}\z/, message:"にはYouTubeチャンネルURLを入力してください" }
  validates :genre_id, presence: true, numericality: { other_than: 1, message:"を選択してください" }
  validates :introduction, presence: true
  
  has_many :videos
  has_many :comments
  has_many :sns_credentials
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      channel_name: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
