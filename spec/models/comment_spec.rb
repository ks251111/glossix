require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    article = FactoryBot.create(:article)
    @comment = FactoryBot.build(:comment, user_id: user.id, article_id: article.id)
    sleep(0.1)
  end

  describe 'コメント機能' do
    context 'コメントできるとき' do
      it 'textがあればコメントできる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできないとき' do
      it 'textが空ではコメントできない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
      it 'userが紐付いていないとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      it 'articleが紐付いていないとコメントできない' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Articleを入力してください")
      end
    end
  end
end
