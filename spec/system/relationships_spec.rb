require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe 'フォロー機能' do
    context 'フォローできるとき' do
      it 'ログインしたユーザーは他のユーザーをフォローできる' do
        # user1でログインする
        sign_in(@user1)
        # user2のユーザー詳細ページに遷移する
        visit user_path(@user2)
        # user2をフォローする
        expect {
          click_button "フォローする"
          sleep(1)
        }.to change { Relationship.count }.by(1)
        # user2をフォロー解除する
        expect {
          click_button "フォロー解除"
          sleep(1)
        }.to change { Relationship.count }.by(-1)
      end
    end

    context 'フォローできないとき' do
      it 'ログアウト状態のユーザーは他のユーザーをフォローできない' do
        # user2のユーザー詳細ページに遷移する
        visit user_path(@user2)
        # フォローボタンがないことを確認する
        expect(page).to have_no_link 'follow-btn', href: relationships_path(follower: @user2)
      end
    end
  end
end
