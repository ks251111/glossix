require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # サインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('user[image]', image_path, make_visible: true)
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect do
        click_button "登録する"
      end.to change(User, :count).by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # サインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード（確認用）', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect do
        click_button "登録する"
      end.to change(User, :count).by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # ログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      click_button "ログイン"
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザー情報と合致しないとログインができない' do
      # トップページへ移動する
      visit root_path
      # ログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンを押す
      click_button "ログイン"
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'ユーザー情報編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザー情報の編集ができるとき' do
    it 'ログインしたユーザーは自分のユーザー情報の編集ができる' do
      # user1でログインする
      sign_in(@user)
      # ヘッダーにあるユーザー名のボタンをクリックする
      find('#login-menus').click
      # ユーザー詳細ページに登録情報の編集へのリンクがあることを確認する
      expect(page).to have_link '登録情報の編集', href: edit_user_registration_path(@user)
      # ユーザー情報編集ページへ移動する
      visit edit_user_registration_path(@user)
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image2.png')
      # 画像選択フォームに画像を添付する
      attach_file('user[image]', image_path, make_visible: true)
      # ユーザー情報を編集する
      fill_in 'ニックネーム', with: 'テスト'
      fill_in 'メールアドレス', with: 'test@email'
      # パスワードを入力する
      fill_in 'パスワード', with: '111111'
      fill_in 'パスワード（確認用）', with: '111111'
      # 「変更する」ボタンを押す
      click_button '変更する'
      # ユーザー詳細ページに遷移したことを確認する
      expect(current_path).to eq(user_path(@user))
      # 編集した内容が反映されていることを確認する(ニックネーム)
      expect(page).to have_content('テスト')
      # 編集した内容が反映されていることを確認する(画像)
      expect(page).to have_selector('img')
    end
  end
end