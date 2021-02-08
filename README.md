# README

## users テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| channel_name | string  | null: false |
| channel_url  | string  | null: false |
| introduction | text    | null: false |
| genre_id     | integer | null: false |
| email        | string  | null: false |
| password     | string  | null: false |

### Association

- has_many :videos
- has_many :comments

## videos テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| video_name   | string     | null: false       |
| video_url    | string     | null: false       |
| overview     | text       | null: false       |
| genre_id     | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| text             | text       | null: false       |
| user             | references | foreign_key: true |
| video            | references | foreign_key: true |
| reply_comment_id | integer    |                   |

### Association

- belongs_to :user
- belongs_to :video