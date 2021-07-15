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

# 制作背景

私は日頃からコスメや美容グッズ等の情報収集としてコスメのクチコミアプリを利用しています。<br>
しかし、そのアプリにはコスメのクチコミ情報はたくさんありますが、気軽に質問や悩みを相談できるようなスペースがないということに気が付きました。<br>
そこで情報収集に加えてユーザー同士の交流もできるようなサービスを作りたいと思い、niceCOSMEの作成に至りました。

# DEMO

## トップページ（ログアウト状態）
[![Image from Gyazo](https://i.gyazo.com/4009be4507453946bcf81d36b90c185c.png)](https://gyazo.com/4009be4507453946bcf81d36b90c185c)

## トップページ（ログイン状態）
[![Image from Gyazo](https://i.gyazo.com/b4588193efdc0f8728284bd98eed563f.gif)](https://gyazo.com/b4588193efdc0f8728284bd98eed563f)
ログイン状態の時はヘッダーの右上にユーザー名とアイコンが表示されます。<br>
ユーザー名をクリックするとマイページやユーザー情報の編集ページ、ログアウトのボタンが出てくるようになっています。

## 新規登録
[![Image from Gyazo](https://i.gyazo.com/da3845a6a57b7fd35185db8fa202f18b.gif)](https://gyazo.com/da3845a6a57b7fd35185db8fa202f18b)
画像がなくても登録でき、画像なしで登録した場合にはデフォルトのアイコンが設定されます。

## ログイン
[![Image from Gyazo](https://i.gyazo.com/64b078fc83b3da1923eb2487af27c67c.gif)](https://gyazo.com/64b078fc83b3da1923eb2487af27c67c)

## ログアウト
[![Image from Gyazo](https://i.gyazo.com/c6bf39f03b7ebdd0411fa69bcb03fd3b.gif)](https://gyazo.com/c6bf39f03b7ebdd0411fa69bcb03fd3b)
ヘッダーのユーザー名をクリックし、ログアウトボタンをクリックするとログアウトできます。<br>
わかりやすいようにログアウトボタンだけ色を濃いピンクにしました。

## 記事投稿機能
[![Image from Gyazo](https://i.gyazo.com/5899e5e2641669a34ac34fe21aa92567.gif)](https://gyazo.com/5899e5e2641669a34ac34fe21aa92567)
画像はあってもなくても投稿できる仕様になっています。

## 画像プレビュー機能、複数枚画像投稿機能
[![Image from Gyazo](https://i.gyazo.com/cdd271d8fc6e6724c04e9c0814c6af70.gif)](https://gyazo.com/cdd271d8fc6e6724c04e9c0814c6af70)
選択した画像を確認できるように画像プレビュー機能、画像を好きだけ貼れるように複数枚画像投稿機能を実装しました。

## 記事詳細ページ
[![Image from Gyazo](https://i.gyazo.com/592d585a3a8bf38c2fda00e4d97b81ed.gif)](https://gyazo.com/592d585a3a8bf38c2fda00e4d97b81ed)

## スライドショー機能
[![Image from Gyazo](https://i.gyazo.com/e619cbe9ee6b363146248880ad385b36.gif)](https://gyazo.com/e619cbe9ee6b363146248880ad385b36)
複数枚画像が投稿された場合は画像が1枚ずつ表示されます。<br>
矢印ボタンまたはドットの部分をクリックすると次の画像が表示されます。

## いいね機能（非同期）
[![Image from Gyazo](https://i.gyazo.com/3fb1075ac45060118c48df98a2bde27f.gif)](https://gyazo.com/3fb1075ac45060118c48df98a2bde27f)
記事にいいねすることができます。<br>
いいねした記事はユーザー詳細ページのいいねした記事一覧からも閲覧することができます。

## 記事編集機能
[![Image from Gyazo](https://i.gyazo.com/c8a9df4c23798b644d668c8537d8371a.gif)](https://gyazo.com/c8a9df4c23798b644d668c8537d8371a)

## 記事削除機能
[![Image from Gyazo](https://i.gyazo.com/a68add4e712405d413f0f6e0225feb41.gif)](https://gyazo.com/a68add4e712405d413f0f6e0225feb41)

## コメント機能
[![Image from Gyazo](https://i.gyazo.com/18cbfbd40249095bb5933ac474f3d113.gif)](https://gyazo.com/18cbfbd40249095bb5933ac474f3d113)

## カテゴリー別一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/6606e93c86ef3a7f37b2cfb0845eddc8.gif)](https://gyazo.com/6606e93c86ef3a7f37b2cfb0845eddc8)
カテゴリー別に記事を探すことができます。<br>
該当のカテゴリーの記事がない場合は「記事がありません」と表示されます。

## 検索機能
[![Image from Gyazo](https://i.gyazo.com/a19f889ed8e5aff1d17b855bb7e96e90.gif)](https://gyazo.com/a19f889ed8e5aff1d17b855bb7e96e90)
キーワードを入力して記事を探すことができます。

## Q&A
[![Image from Gyazo](https://i.gyazo.com/ef4b74524013fd902ddd90211a54ff5a.gif)](https://gyazo.com/ef4b74524013fd902ddd90211a54ff5a)
[![Image from Gyazo](https://i.gyazo.com/b36cb145c550cd00cbc1730632dbc8f4.gif)](https://gyazo.com/b36cb145c550cd00cbc1730632dbc8f4)
質問や悩みを相談できる掲示板です。<br>
トップページに投稿一覧が表示されます。<br>
「質問・相談する」ボタンをクリックすると、投稿画面に遷移します。<br>
スレッドをクリックすると詳細画面に遷移します。<br>
詳細画面から投稿内容の編集や削除、コメントの投稿が可能です。

## ユーザー詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/98529f925a15e51e8bc86c910b5bead4.gif)](https://gyazo.com/98529f925a15e51e8bc86c910b5bead4)
[![Image from Gyazo](https://i.gyazo.com/31d290ec1ce79dda0281238a7e2ba0d8.gif)](https://gyazo.com/31d290ec1ce79dda0281238a7e2ba0d8)
ヘッダーのマイページまたは投稿詳細ページのユーザー名をクリックするとユーザー詳細ページに遷移します。

## フォロー機能、フォロー・フォロワー一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/f862cea71db0289c07bcbad795cae7a7.gif)](https://gyazo.com/f862cea71db0289c07bcbad795cae7a7)
ユーザーのフォローやフォロー解除をすることができます。<br>
フォロー・フォロワー一覧を閲覧することも可能です。

## タブメニュー
[![Image from Gyazo](https://i.gyazo.com/1e44b312e60bded99fd49233288ebb95.gif)](https://gyazo.com/1e44b312e60bded99fd49233288ebb95)
タブをクリックすることで投稿した記事一覧、いいねした記事一覧の表示を切り替えることができます。

## ユーザー編集機能
[![Image from Gyazo](https://i.gyazo.com/898d8d25e86a3aef5b1249488188f27c.gif)](https://gyazo.com/898d8d25e86a3aef5b1249488188f27c)
ヘッダーの「登録情報の編集」のリンクをクリックするとユーザーの編集画面に遷移します。<br>
パスワードは変更したい時のみ入力し、変更する必要がない場合はスキップできる仕様になっています。

## エラーメッセージの日本語対応
[![Image from Gyazo](https://i.gyazo.com/5ae30dafd370218aece7550dc2990769.gif)](https://gyazo.com/5ae30dafd370218aece7550dc2990769)
登録や投稿に失敗した場合のエラーメッセージが日本語で表示されます。

## ページネーション機能
[![Image from Gyazo](https://i.gyazo.com/eb6898c6e8645248f522a4ee69e92d3e.gif)](https://gyazo.com/eb6898c6e8645248f522a4ee69e92d3e)
記事が１０件以上になると、11件目以降が次のページに表示されるようになります。

## レスポンシブ対応
[![Image from Gyazo](https://i.gyazo.com/750696e2aa838d363d71d56a992d2f38.png)](https://gyazo.com/750696e2aa838d363d71d56a992d2f38)
[![Image from Gyazo](https://i.gyazo.com/67dee2b43826b1ba1d20f78782417546.png)](https://gyazo.com/67dee2b43826b1ba1d20f78782417546)
スマホ表示とタブレット表示に対応しています。

## ハンバーガーメニュー
[![Image from Gyazo](https://i.gyazo.com/894d7425fe7ee4a9836b292307c3826f.gif)](https://gyazo.com/894d7425fe7ee4a9836b292307c3826f)
右上のボタンをクリックすると隠れていたメニューが表示されます。
スマホ表示時に対応しています。

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
- ページネーション機能
- タブメニュー
- ハンバーガーメニュー
- レスポンシブ対応

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
