require 'rails_helper'

RSpec.describe Response, type: :model do
  before do
    user = FactoryBot.create(:user)
    talk = FactoryBot.create(:talk)
    @response = FactoryBot.build(:response, user_id: user.id, talk_id: talk.id)
    sleep(0.1)
  end

  describe '掲示板の回答機能' do
    context '回答できるとき' do
      it 'textが存在すれば回答できる' do
        expect(@response).to be_valid
      end
    end

    context '回答できないとき' do
      it 'textが空では回答できない' do
        @response.text = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("回答を入力してください")
      end
      it 'userが紐付いていなければ回答できない' do
        @response.user = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("Userを入力してください")
      end
      it 'talkが紐付いていなければ回答できない' do
        @response.talk = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("Talkを入力してください")
      end
    end
  end
end
