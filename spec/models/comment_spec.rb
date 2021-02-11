require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント" do
    context 'コメントできるとき' do
      it "textが存在すればコメントできる" do
        expect(@comment).to be_valid
      end
    end
    context 'コメントできないとき' do
      it "textが空だとコメントできない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include "コメントを入力してください"
      end
    end
  end
end
