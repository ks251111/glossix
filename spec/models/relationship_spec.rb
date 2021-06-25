require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    @relationship = @user.follow(@another_user)
    sleep(0.1)
  end

  describe 'フォロー機能' do
    context 'フォローできるとき' do
      it 'フォローする側のuserとフォローされる側のuserが存在すればフォローできる' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォローできないとき' do
      it 'フォローする側のuserが紐付いていなければフォローできない' do
        @relationship.user = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Userを入力してください")
      end
      it 'フォローされる側のuserが紐付いていなければフォローできない' do
        @relationship.follower = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include("Followerを入力してください")
      end
    end
  end
end
