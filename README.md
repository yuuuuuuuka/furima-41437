# README


## users

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false,unique: true |
| encysted_password    | string | null: false |  
| password             | string | null: false |
| birth_day            | string | null: false |
| kanji_name           | string | null: false |
| kana_name            | string | null: false |    



has_many :items
has_many :orders

## items

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| image                | text        | null: false |
| name                 | string      | null: false |
| explanation          | text        | null: false |
| price                | integer     | null: false |
| category＿id         | string      | null: false |
| user                 | references  | null: false,foreign_key: true | ><カラム不足>

has_one :order
belong_to :user



## orders

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| comment        | text       | null: false |
| favorite       | integer    | null: false |



  ＜商品購入履歴テーブルには「どのユーザーが」「どの商品を」購入したかのみを保存＞


belong_to :user
belong_to :item
belong_to :address

## Addresses

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| postal_code          | string      | null: false |
| prefecture           | string      | null: false |
| city                 | string      | null: false |
| address              | string      | null: false |
| building             | string      | null: false |
| phone_number         | string      | null: false |
| order                | references  | null: false,foreign_key: true |
| price                | references  | null: false,foreign_key: true |

belong_to :items
belong_to :order














This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:  


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
