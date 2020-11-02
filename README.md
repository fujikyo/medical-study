# プロダクト名
Medical Study

# アプリケーションの概要
記事投稿ができる一般的なアプリケーションです。
医療関係者(理学療法士)が勉強内容を投稿し、シェアすることができるサービスを意識して作成しました。

# 機能一覧
・一覧表示
・ログイン、ログアウト機能
・記事投稿機能(画像含む)
・削除機能
・編集機能
・コメント機能
・検索機能

# 開発環境
ruby on rails,ruby,html,css,JavaScript,mysql,AWS(S3)

# その他
Rspecによるテスト導入。

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
| detail                       | text       | null: false                    |
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