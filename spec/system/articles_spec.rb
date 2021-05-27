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
      sign_in(@user)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('記事を投稿する')
      # 投稿ページに移動する
      visit new_article_path
      # フォームに情報を入力する
      fill_in 'article_title', with: @article_title
      fill_in 'article_text', with: @article_text
      select 'メイク', from: 'article[category_id]'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('article[images][]', image_path, make_visible: true)
      # 送信するとarticleモデルのカウントが1上がることを確認する
      expect do
        click_button "投稿する"
      end.to change(Article, :count).by(1)
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容の記事が存在することを確認する(画像)
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容の記事が存在することを確認する(タイトル)
      expect(page).to have_content(@article_title)
      # トップページには先ほど投稿した内容の記事が存在することを確認する(20文字以内のテキスト)
      expect(page).to have_content(@article_text.truncate(20))
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

RSpec.describe '投稿詳細', type: :system do
  before do
    @article = FactoryBot.create(:article)
  end

  it 'ログインしたユーザーは記事詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@article.user)
    # 記事の詳細ページに遷移する
    visit article_path(@article)
    # 詳細ページに記事の内容が含まれている
    expect(page).to have_selector('img')
    expect(page).to have_content("#{@article.title}")
    expect(page).to have_content("#{@article.text}")
    expect(page).to have_content("#{@article.category.name}")
    expect(page).to have_selector("div.favorite")
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'

  end

  it 'ログインしていない状態で記事詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    visit root_path
    # 記事の詳細ページに遷移する
    visit article_path(@article)
    # 詳細ページに記事の内容が含まれている
    expect(page).to have_selector('img')
    expect(page).to have_content("#{@article.title}")
    expect(page).to have_content("#{@article.text}")
    expect(page).to have_content("#{@article.category.name}")
    expect(page).to have_selector("div.favorite")
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
  end
end

RSpec.describe '記事編集', type: :system do
  before do
    @article1 = FactoryBot.create(:article)
    @article2 = FactoryBot.create(:article)
  end

  context '記事編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した記事の編集ができる' do
      # article1を投稿したユーザーでログインする
      sign_in(@article1.user)
      # article1の詳細ページへ遷移する
      visit article_path(@article1)
      # article1に「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_article_path(@article1)
      # 編集ページへ遷移する
      visit edit_article_path(@article1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#article_title').value
      ).to eq(@article1.title)
      expect(
        find('#article_text').value
      ).to eq(@article1.text)
      expect(
        find('#article_category_id').value
      ).to eq "#{@article1.category_id}"
      # 投稿内容を編集する
      fill_in 'article_title', with: "#{@article1.title}+編集したタイトル"
      fill_in 'article_text', with: "#{@article1.text}+編集したテキスト"
      select 'ネイル', from: 'article[category_id]'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image2.png')
      # 画像選択フォームに画像を添付する
      attach_file('article[images][]', image_path, make_visible: true)
      # 編集してもArticleモデルのカウントは変わらないことを確認する
      expect do
        click_button "投稿する"
      end.to change(Article, :count).by(0)
      # article1の詳細ページに遷移したことを確認する
      expect(current_path).to eq(article_path(@article1))
      # 詳細ページには先ほど変更した内容の記事が存在することを確認する(画像)
      expect(page).to have_selector('img')
      # 詳細ページには先ほど変更した内容の記事が存在することを確認する(タイトル)
      expect(page).to have_content("#{@article1.title}+編集したタイトル")
      # 詳細ページには先ほど変更した内容の記事が存在することを確認する(テキスト)
      expect(page).to have_content("#{@article1.text}+編集したテキスト")
      # 詳細ページには先ほど変更した内容の記事が存在することを確認する(カテゴリー)
      expect(page).to have_content("#{@article1.category_id}")
    end
  end

  context '記事編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した記事の編集画面には遷移できない' do
      # article1を投稿したユーザーでログインする
      sign_in(@article1.user)
      # article2の詳細ページへ遷移する
      visit article_path(@article2)
      # article2に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_article_path(@article2)
    end
    it 'ログインしていないと記事の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # article1の詳細ページへ遷移する
      visit article_path(@article1)
      # article1の詳細ページに「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_article_path(@article1)
      # トップページへ遷移する
      visit root_path
      # article2の詳細ページへ遷移する
      visit article_path(@article2)
      # article2の詳細ページに「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_article_path(@article2)
    end
  end
end

RSpec.describe '記事削除', type: :system do
  before do
    @article1 = FactoryBot.create(:article)
    @article2 = FactoryBot.create(:article)
  end

  context '記事削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した記事の削除ができる' do
      # article1を投稿したユーザーでログインする
      sign_in(@article1.user)    
      # article1の詳細ページへ遷移する
      visit article_path(@article1)
      # article1の詳細ページに「削除」へのリンクがあることを確認する
      expect(page).to have_link '削除', href: article_path(@article1)
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect {
        find_link('削除', href: article_path(@article1)).click
      }.to change { Article.count }.by(-1)
      # トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにはarticle1の内容が存在しないことを確認する(タイトル)
      expect(page).to have_no_content("#{@article1.title}")
    end
  end

  context '記事削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した記事の削除ができない' do
      # article1を投稿したユーザーでログインする
      sign_in(@article1.user)
      # article2の詳細ページへ遷移する
      visit article_path(@article2)
      # article2の詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: article_path(@article2)
    end
    it 'ログインしていないと記事の削除ボタンが表示されない' do
      # トップページに移動する
      visit root_path
      # article1の詳細ページへ遷移する
      visit article_path(@article1)
      # article1の詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: article_path(@article1)
      # トップページに移動する
      visit root_path
      # article2の詳細ページへ遷移する
      visit article_path(@article2)
      # article2の詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: article_path(@article2)
    end
  end
end