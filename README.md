# niceCOSME

美容の情報交換アプリです。<br>
美容に関する記事の投稿や質問・悩みを相談することができます。

# 本番環境

## URL

https://nicecosme.herokuapp.com/

## Basic認証

- ユーザー名：test
- パスワード：1111

## テスト用アカウント

- メールアドレス：test@email
- パスワード：111111

# 使用技術(開発環境)

## バックエンド
- Ruby
- Ruby on Rails

## フロントエンド
- JavaScript
- jQuery

## データベース
- MySQL

## ソース管理

- GitHub
- GitHubDesktop

## テスト

- RSpec

## エディタ

- VSCode

# 機能一覧

- Basic認証
- ユーザー登録、ログイン機能
- ユーザー編集機能
- ユーザー詳細表示機能
- 投稿機能
- 投稿一覧表示機能
- 投稿詳細表示機能
- 画像投稿機能
- 画像プレビュー機能
- 複数枚画像投稿機能
- スライドショー機能
- いいね機能
- いいね一覧表示機能
- コメント機能
- 検索機能
- フォロー機能
- フォロー・フォロワー一覧表示機能
- パンくずリスト機能
- カテゴリー別一覧表示機能
- エラーメッセージの日本語対応

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :articles
- has_many :comments
- has_many :likes
- has_many :talks
- has_many :responses
- has_many :relationships

## articlesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :likes

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article

## likesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| article | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article

## talksテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :responses

## responsesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| talk   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :talk

## relationshipsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| follower | references | null: false, foreign_key: true |

### Association

- belongs_to :user