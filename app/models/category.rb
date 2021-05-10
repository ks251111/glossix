class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メイク' }
    { id: 3, name: 'スキンケア' }
  ]
end
