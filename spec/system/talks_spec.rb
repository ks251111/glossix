require 'rails_helper'

RSpec.describe "掲示板の投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @talk_title = Faker::Lorem.sentence
    @talk_text = Faker::Lorem.sentence
  end

  context '掲示板の投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 掲示板のトップページに遷移する
      visit talks_path
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('質問・相談する')
      # 投稿ページに移動する
      visit new_talk_path
      # フォームに情報を入力する
      fill_in 'talk_title', with: @talk_title
      fill_in 'talk_text', with: @talk_text
      # 送信するとTalkモデルのカウントが1上がることを確認する
      expect do
        click_button "投稿する"
      end.to change(Talk, :count).by(1)
      # 掲示板のトップページに遷移することを確認する
      expect(current_path).to eq(talks_path)
      # 掲示板のトップページには先ほど投稿した内容のスレッドが存在することを確認する(タイトル)
      expect(page).to have_content(@talk_title)
    end
  end

  context '掲示板に投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # 掲示板のトップページに遷移する
      visit talks_path
      # 新規投稿ページへのボタンを押す
      click_on ('質問・相談する')
      # ログインページへ遷移したことを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
