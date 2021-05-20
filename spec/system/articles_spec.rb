require 'rails_helper'

RSpec.describe "記事投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article_title = Faker::Lorem.sentence
    @article_text = Faker::Lorem.sentence
    @article_category_id = 2
  end

  context '記事投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button "ログイン"
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('記事を投稿する')
      # 投稿ページに移動する
      visit new_article_path
      # フォームに情報を入力する
      fill_in 'article_title', with: @article_title
      fill_in 'article_text', with: @article_text
      select 'メイク', from: 'article[category_id]'
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('article[images][]', image_path, make_visible: true)
      # 送信するとarticleモデルのカウントが1上がることを確認する
      expect do
        click_button "投稿する"
      end.to change(Article, :count).by(1)
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容の記事が存在することを確認する(画像)
      
      # トップページには先ほど投稿した内容の記事が存在することを確認する(タイトル)
      expect(page).to have_content(@article_title)
    end
  end

  context '記事投稿ができないとき' do
    it 'ログインしていないとログインページへ遷移する' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページのボタンを押す
      click_on ('記事を投稿する')
      # ログインページへ遷移したことを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
