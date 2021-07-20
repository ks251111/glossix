require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do
  before do
    @article = FactoryBot.create(:article)
  end

  context 'いいねできるとき' do
    it 'ログインしたユーザーは投稿された記事にいいね、いいね解除ができる' do
      # ログインする
      sign_in(@article.user)
      # 記事の詳細ページに遷移する
      visit article_path(@article)
      # いいねボタンを押すとLikeモデルのカウントが1上がることを確認する
      expect{
        find('#like').click
      }.to change { Like.count }.by(1)
      # いいねを解除するとLikeモデルのカウントが1減ることを確認する
      expect{
        find('#unlike').click
      }.to change { Like.count }.by(-1)
    end
  end

  context 'いいねできないとき' do
    it 'ログアウト状態のユーザーはいいね機能を使えない' do
      # 記事の詳細ページに遷移する
      visit article_path(@article)
      # いいねボタンのリンクがないことを確認する
      expect(page).to have_no_link '#like', href: article_likes_path(@article)
    end
  end
end
