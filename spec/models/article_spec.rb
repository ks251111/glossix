require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿機能' do
    context '記事投稿できるとき' do
      it 'すべての項目が存在すれば投稿できる' do
        expect(@article).to be_valid
      end
      it 'imagesが空でも投稿できる' do
        @article.images = ''
        expect(@article).to be_valid
      end
    end

    context '記事投稿できないとき' do
      it 'titleが空では投稿できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では投稿できない' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが未選択では投稿できない' do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include("Category must be other than 1")
      end
      it 'userが紐付いていないと投稿できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end
end
