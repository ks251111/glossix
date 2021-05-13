class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.text       :text, null: false
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true
      t.timestamps
    end
  end
end
