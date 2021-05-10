class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メイク' }
    { id: 3, name: 'スキンケア' }
    { id: 4, name: 'ボディケア' }
    { id: 5, name: 'ヘアケア・スタイリング' }
    { id: 6, name: 'ネイル' }
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
