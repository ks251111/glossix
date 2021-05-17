require 'rails_helper'

RSpec.describe Response, type: :model do
  before do
    user = FactoryBot.create(:user)
    talk = FactoryBot.create(:talk)
    @response = FactoryBot.build(:response, user_id: user.id, talk_id: talk.id)
  end

  describe '掲示板のコメント機能' do
    context 'コメントできるとき' do
      it 'textが存在すればコメントできる' do
        expect(@response).to be_valid
      end
    end

    context 'コメントできないとき' do
      it 'textが空ではコメントできない' do
        @response.text = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていなければコメントできない' do
        @response.user = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("User must exist")
      end
      it 'talkが紐付いていなければコメントできない' do
        @response.talk = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("Talk must exist")
      end
    end
  end
end
