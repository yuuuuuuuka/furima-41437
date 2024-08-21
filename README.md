# README


## usersテーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false |  
| birthday             | date   | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false | 
| kana_first_name      | string | null: false |
| kana_last_name       | string | null: false |   
### Association
has_many :items
has_many :orders


## itemsテーブル

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| name                 | string      | null: false |
| explanation          | text        | null: false |
| price                | integer     | null: false |
| user                 | references  | null: false,foreign_key: true |
| item_situation_id     | integer | null: false|
| prefecture_id         | integer | null: false |
| category_id           | integer | null: false |
| shipping_day_id       | integer | null: false |
| shipping_location_id  | integer | null: false |
| load_id               | integer | null: false |
### Association
has_one :order
belongs_to :user



## ordersテーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address

## Addressesテーブル

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| postal_code          | string      | null: false |
| prefecture_id        | integer     | null: false |
| city                 | string      | null: false |
| address              | string      | null: false |
| building             | string      |             |
| phone_number         | string      | null: false |
| order                | references  | null: false,foreign_key: true |

belongs_to :order














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
