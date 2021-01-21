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
        expect(@user.errors.full_messages).to include "チャンネル名を入力してください"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it "emailが登録済だと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end
      it "emailに@が無いと登録できない" do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it "passwordが全角だと登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数のみで入力してください"
      end
      it "passwordは２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "passwordが確認用と異なると登録できない" do
        @user.password_confirmation = "11"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "channel_urlが空だと登録できない" do
        @user.channel_url = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "チャンネルURLにはYouTubeチャンネルURLを入力してください"
      end
      it "channel_urlがYouTubeチャンネルと異なると登録できない" do
        @user.channel_url = "https://www.google.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "チャンネルURLにはYouTubeチャンネルURLを入力してください"
      end
      it "introductionが空だと登録できない" do
        @user.introduction = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "チャンネル紹介を入力してください"
      end
      it "genre_idが空だと登録できない" do
        @user.genre_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "動画ジャンルを選択してください"
      end
      it "genre_idが1だと登録できない" do
        @user.genre_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include "動画ジャンルを選択してください"
      end
    end
  end
end
