require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー情報" do
    context '新規登録できるとき' do
      it "channel_name、email、password、password_confirmation、channel_url、introduction、genre_id、imageが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "imageが空でも登録できる" do
        @user.image = nil
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "channel_nameが空だと登録できない" do
        @user.channel_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Channel name can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが登録済だと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailに@が無いと登録できない" do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが全角だと登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordは２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが確認用と異なると登録できない" do
        @user.password_confirmation = "11"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "channel_urlが空だと登録できない" do
        @user.channel_url = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Channel url can't be blank"
      end
      it "channel_urlがYouTubeチャンネルと異なると登録できない" do
        @user.channel_url = "https://www.google.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Channel url is invalid"
      end
      it "introductionが空だと登録できない" do
        @user.introduction = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Introduction can't be blank"
      end
      it "genre_idが空だと登録できない" do
        @user.genre_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Genre can't be blank"
      end
      it "genre_idが1だと登録できない" do
        @user.genre_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include "Genre must be other than 1"
      end
    end
  end
end
