require 'rails_helper'

RSpec.describe Video, type: :model do
  before do
    @video = FactoryBot.build(:video)
  end

  describe "動画PR" do
    context '動画PRできるとき' do
      it "video_name、video_url、overview、genre_id、imageが存在すれば登録できる" do
        expect(@video).to be_valid
      end
      it "imageが空でも登録できる" do
        @video.image = nil
        expect(@video).to be_valid
      end
    end
    context '動画PRできないとき' do
      it "video_nameが空だと投稿できない" do
        @video.video_name = ""
        @video.valid?
        expect(@video.errors.full_messages).to include "Video name can't be blank"
      end
      it "video_urlが空だと投稿できない" do
        @video.video_url = ""
        @video.valid?
        expect(@video.errors.full_messages).to include "Video url can't be blank"
      end
      it "video_urlがYouTube動画と異なると投稿できない" do
        @video.video_url = "https://www.google.com"
        @video.valid?
        expect(@video.errors.full_messages).to include "Video url is invalid"
      end
      it "overviewが空だと投稿できない" do
        @video.overview = ""
        @video.valid?
        expect(@video.errors.full_messages).to include "Overview can't be blank"
      end
      it "genre_idが空だと登録できない" do
        @video.genre_id = ""
        @video.valid?
        expect(@video.errors.full_messages).to include "Genre can't be blank"
      end
      it "genre_idが1だと登録できない" do
        @video.genre_id = 1
        @video.valid?
        expect(@video.errors.full_messages).to include "Genre must be other than 1"
      end
    end
  end
end
