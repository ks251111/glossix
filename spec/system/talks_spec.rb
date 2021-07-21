require 'rails_helper'

RSpec.describe "Q&Aの投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @talk_title = Faker::Lorem.sentence
    @talk_text = Faker::Lorem.sentence
  end

  context 'Q&Aの投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # Q&Aのトップページに遷移する
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
      # Q&Aのトップページに遷移することを確認する
      expect(current_path).to eq(talks_path)
      # Q&Aのトップページには先ほど投稿した内容が存在することを確認する(タイトル)
      expect(page).to have_content(@talk_title)
      # Q&Aのトップページには先ほど投稿した内容が存在することを確認する(テキスト)
      expect(page).to have_content(@talk_text)
    end
  end

  context 'Q&Aに投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # Q&Aのトップページに遷移する
      visit talks_path
      # 新規投稿ページへのボタンを押す
      click_on('質問・相談する')
      # ログインページへ遷移したことを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'Q&A詳細', type: :system do
  before do
    @talk = FactoryBot.create(:talk)
  end

  it 'ログインしたユーザーはQ&A詳細ページに遷移して回答用のフォームが表示される' do
    # ログインする
    sign_in(@talk.user)
    # Q&Aのトップページに移動する
    visit talks_path
    # 質問の詳細ページに遷移する
    visit talk_path(@talk)
    # 詳細ページに質問の内容が含まれている
    expect(page).to have_content(@talk.title)
    expect(page).to have_content(@talk.text)
    # 回答用のフォームが存在する
    expect(page).to have_selector 'form'
  end

  it 'ログインしていない状態でQ&A詳細ページに遷移できるものの回答用のフォームが表示されない' do
    # Q&Aのトップページに移動する
    visit talks_path
    # 質問の詳細ページに遷移する
    visit talk_path(@talk)
    # 詳細ページに質問の内容が含まれている
    expect(page).to have_content(@talk.title)
    expect(page).to have_content(@talk.text)
    # 「回答には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content '回答には新規登録/ログインが必要です'
  end
end

RSpec.describe 'Q&A編集', type: :system do
  before do
    @talk1 = FactoryBot.create(:talk)
    @talk2 = FactoryBot.create(:talk)
  end

  context '質問の編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した質問の編集ができる' do
      # talk1を投稿したユーザーでログインする
      sign_in(@talk1.user)
      # Q&Aのトップページに移動する
      visit talks_path
      # talk1の詳細ページに遷移する
      visit talk_path(@talk1)
      # 「･･･」のボタンをクリックする
      find('#dropdown').click
      # 「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_talk_path(@talk1)
      # 編集ページへ遷移する
      visit edit_talk_path(@talk1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#talk_title').value
      ).to eq(@talk1.title)
      expect(
        find('#talk_text').value
      ).to eq(@talk1.text)
      # 投稿内容を編集する
      fill_in 'talk_title', with: "#{@talk1.title}+編集したタイトル"
      fill_in 'talk_text', with: "#{@talk1.text}+編集したテキスト"
      # 編集してもTalkモデルのカウントは変わらないことを確認する
      expect do
        click_button "投稿する"
      end.to change(Talk, :count).by(0)
      # talk1の詳細ページに遷移することを確認する
      expect(current_path).to eq(talk_path(@talk1))
      # 詳細ページには先ほど変更した内容の質問が存在することを確認する(タイトル)
      expect(page).to have_content("#{@talk1.title}+編集したタイトル")
      # 詳細ページには先ほど変更した内容の質問が存在することを確認する(テキスト)
      expect(page).to have_content("#{@talk1.text}+編集したテキスト")
    end
  end

  context '質問の編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した質問の編集画面には遷移できない' do
      # talk1を投稿したユーザーでログインする
      sign_in(@talk1.user)
      # Q&Aトップページに移動する
      visit talks_path
      # talk2の詳細ページに遷移する
      visit talk_path(@talk2)
      # talk2の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
    end
    it 'ログインしていないと質問の編集画面には遷移できない' do
      # Q&Aトップページに移動する
      visit talks_path
      # talk1の詳細ページに遷移する
      visit talk_path(@talk1)
      # talk1の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
      # Q&Aトップページに移動する
      visit talks_path
      # talk2の詳細ページに遷移する
      visit talk_path(@talk2)
      # talk2の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
    end
  end
end

RSpec.describe 'Q&A削除', type: :system do
  before do
    @talk1 = FactoryBot.create(:talk)
    @talk2 = FactoryBot.create(:talk)
  end

  context '質問の削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した質問の削除ができる' do
      # talk1を投稿したユーザーでログインする
      sign_in(@talk1.user)
      # Q&Aトップページへ遷移する
      visit talks_path
      # talk1の詳細ページへ遷移する
      visit talk_path(@talk1)
      # 「･･･」のボタンをクリックする
      find('#dropdown').click
      # 「削除」へのリンクがあることを確認する
      expect(page).to have_link '削除', href: talk_path(@talk1)
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect {
        find_link('削除', href: talk_path(@talk1)).click
      }.to change { Talk.count }.by(-1)
      # Q&Aトップページに遷移したことを確認する
      expect(current_path).to eq(talks_path)
      # トップページにはtalk1の内容が存在しないことを確認する(タイトル)
      expect(page).to have_no_content(@talk1.title)
    end
  end

  context '質問の削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した質問の削除ができない' do
      # talk1を投稿したユーザーでログインする
      sign_in(@talk1.user)
      # Q&Aトップページに遷移する
      visit talks_path
      # talk2の詳細ページへ遷移する
      visit talk_path(@talk2)
      # talk2の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
    end
    it 'ログインしていないと質問の削除ボタンがない' do
      # Q&Aトップページに遷移する
      visit talks_path
      # talk1の詳細ページに遷移する
      visit talk_path(@talk1)
      # talk1の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
      # Q&Aトップページに遷移する
      visit talks_path
      # talk2の詳細ページに遷移する
      visit talk_path(@talk2)
      # talk2の詳細ページに「･･･」のボタンがないことを確認する
      expect(page).to have_no_selector('#dropdown')
    end
  end
end
