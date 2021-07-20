require 'rails_helper'
describe ArticlesController, type: :request do
  before do
    @article = FactoryBot.create(:article)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の画像が存在する' do
      get root_path
      expect(response.body).to include('article-img')
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のタイトルが存在する' do
      get root_path
      expect(response.body).to include(@article.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の本文が存在する' do
      get root_path
      expect(responce.body).to include(@article.text)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の投稿者名が存在する' do
      get root_path
      expect(response.body).to include(@article.user.nickname)
    end
    it 'indexアクションにリクエストするとレスポンスにいいね数が存在する' do
      get root_path
      expect(response.body).to include(@article.likes.count)
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get article_path(@article)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のタイトルが存在する' do
      get article_path(@article)
      expect(response.body).to include(@article.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事の画像が存在する' do
      get article_path(@article)
      expect(response.body).to include('article-show-img')
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事の投稿者名が存在する' do
      get article_path(@article)
      expect(response.body).to include(@article.user.nickname)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事の本文が存在する' do
      get article_path(@article)
      expect(response.body).to include(@article.text)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のカテゴリーが存在する' do
      get article_path(@article)
      expect(response.body).to include(@article.category.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のいいねボタンが存在する' do
      get article_path(@article)
      expect(response.body).to include('favorite')
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のコメントフォームが存在する' do
      get article_path(@article)
      expect(response.body).to include('comment-form')
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの記事のコメント一覧が存在する' do
      get article_path(@article)
      expect(response.body).to include('コメント一覧')
    end
  end
end
