require 'rails_helper'

RSpec.describe '掲示板コメント機能', type: :system do
  before do
    @talk = FactoryBot.create(:talk)
    @response1 = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはスレッド詳細ページでコメント投稿ができる' do
    # ログインする
    sign_in(@talk.user)
    # 掲示板トップページに移動する
    visit talks_path
    # 記事詳細ページに遷移する
    visit talk_path(@talk)
    # フォームに情報を入力する
    fill_in 'response_text', with: @response1
    # コメントを送信すると、Responseモデルのカウントが1上がることを確認する
    expect do
      click_button "コメント"
    end.to change(Response, :count).by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(talk_path(@talk))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @response1
  end
end
