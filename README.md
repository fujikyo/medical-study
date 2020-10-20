# アプリケーションの概要
理学療法士が勉強内容を投稿し、シェアするサービスです。

# 機能一覧
・一覧表示(勉強内容を画像と文章で投稿できる)
・ログイン機能(投稿者、質問者の情報がわか)
・削除機能(投稿内容を削除できる)
・編集機能(投稿内容を編集できる)
・コメント機能(投稿内容にコメントができる)



# 技術一覧
Ruby on Rails,html,css

# テーブル設計

## users テーブル

| Column                    | Type    | Options     |
| --------                  | ------- | ----------- |
| email                     | string  | null: false |
| password                  | string  | null: false |
| name                      | string  | null: false |
| specialize                | integer | null: false |
| experience                | integer | null: false |
| word                      | text    | null: false |


### Association

- has_many :comment
- has_many :post

## posts テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| title                        | string     | null: false                    |
| detail                   　  | text       | null: false                    |
| user                         | references | null: false, foreign_key: true |

 ### Association

- belongs_to :user
- has__many  :comment

## comments テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| content                      | text       | null: false                    |
| user                         | references | null: false, foreign_key: true |
| post                         | references | null: false, foreign_key: true |


 ### Association

- belongs_to :user
- belongs_to :post
