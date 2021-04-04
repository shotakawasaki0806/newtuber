# README

## アプリ名

NewTuber

## 概要

- ユーザー登録
- 動画PR投稿
- 動画PR検索
- 動画PRコメント

## 本番環境

### URL

https://newtuber.herokuapp.com/

### テスト用アカウント

- メールアドレス：test@test
- パスワード：testtest

## 制作背景(意図)

自分のYouTubeチャンネル及び動画の宣伝を行うことで、
新しくYouTuberとして有名になるためのツールとして制作しました。

## 利用方法

トップページでは気になる動画PRをクリックすることで、
その動画PRの詳細を閲覧することができます。
また、トップページではキーワード検索が可能です。

詳細ページでは、動画のURLをクリックすることで、
実際のYouTube動画に別タブでリンクされます。
その下にはTwitter等のSNSでの共有、同じジャンルの動画PR一覧へのリンクがあります。
また、ログインユーザーは詳細ページでコメントおよび返信が可能です。

## 工夫したポイント

- ユーザー登録のチャンネルURLおよび動画PRの動画URLは各々不適切なURLを登録できないようバリデーションを組みました。
- ユーザー情報のチャンネル紹介文と動画PRの動画概要欄にはURLを記載した場合、自動的にリンクされるようヘルパーメソッドを作成しました。
- ブラウザ上で下にスクロールした際に、最上部へスクロールされるボタンが表示されるよう実装しました。
- 画像投稿は任意のため、登録されていない場合はNoImageの画像を表示するようにしました。
- 登録及び投稿する際の画像を選択した際、選択した画像がプレビューで表示されます。
- 登録及び投稿する際に不備が出た場合、エラーメッセージを表示します。
- Twitter等のSNSで簡単に共有できるようボタンを設置しました。
- 動画詳細ページでは同じ動画ジャンルの動画PRを一覧で見ることができるリンクを設置しました。
- コメント欄では返信が可能です。
- Googleアカウントでの新規登録が可能です。
- 投稿済の動画PRを削除する際、確認画面をブラウザより表示されます。
- 動画PR検索の際スペースを入れることでand検索が可能です。

## 開発環境

- RubyonRails(6.0.3.4)
- Ruby(2.6.5)
- JavaScript
- VSCode(Visual Studio Code)

## 課題や今後実装したい機能

- JavaScriptの活用強化
- 検索機能の強化（or検索やnot検索等）
- コメント返信欄の表示簡略化
- おすすめ投稿表示機能

## DB設計

### users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| channel_name | string  | null: false |
| channel_url  | string  | null: false |
| introduction | text    | null: false |
| genre_id     | integer | null: false |
| email        | string  | null: false |
| password     | string  | null: false |

#### Association

- has_many :videos
- has_many :comments

### videos テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| video_name   | string     | null: false       |
| video_url    | string     | null: false       |
| overview     | text       | null: false       |
| genre_id     | integer    | null: false       |
| user         | references | foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments

### comments テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| text             | text       | null: false       |
| user             | references | foreign_key: true |
| video            | references | foreign_key: true |
| reply_comment_id | integer    |                   |

#### Association

- belongs_to :user
- belongs_to :video
