require 'rails_helper'

RSpec.describe Talk, type: :model do
  before do
    @talk = FactoryBot.build(:talk)
  end

  describe '掲示板の投稿機能' do
    context '投稿できるとき' do
      it 'titleとtextが存在すれば投稿できる' do
        expect(@talk).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'titleが空では投稿できない' do
        @talk.title = ''
        @talk.valid?
        expect(@talk.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'textが空では投稿できない' do
        @talk.text = ''
        @talk.valid?
        expect(@talk.errors.full_messages).to include("本文を入力してください")
      end
      it 'userが紐付いていないと投稿できない' do
        @talk.user = nil
        @talk.valid?
        expect(@talk.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
