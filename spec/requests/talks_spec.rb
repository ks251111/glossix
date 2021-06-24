require 'rails_helper'

RSpec.describe "Talks", type: :request do
  before do
    @talk = FactoryBot.create(:talk)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get talks_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのスレッドのタイトルが存在する' do
      get talks_path
      expect(response.body).to include(@talk.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのスレッドの本文が存在する' do
      get talks_path
      expect(response.body).to include(@talk.text)
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get talk_path(@talk)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのスレッドのタイトルが存在する' do
      get talk_path(@talk)
      expect(response.body).to include(@talk.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿者名が存在する' do
      get talk_path(@talk)
      expect(response.body).to include(@talk.user.nickname)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのスレッドの本文が存在する' do
      get talk_path(@talk)
      expect(response.body).to include(@talk.text)
    end
    it 'showアクションにリクエストするとレスポンスに回答フォームが存在する' do
      get talk_path(@talk)
      expect(response.body).to include('comment-form')
    end
    it 'showアクションにリクエストするとレスポンスに回答一覧が存在する' do
      get talk_path(@talk)
      expect(response.body).to include('回答一覧')
    end
  end
end
