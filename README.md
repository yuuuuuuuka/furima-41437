# README




## orders

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| items_id       | references | null: false, foreign_key: true |
| user_address   | references | null: false, foreign_key: true |
| items_price       | references | null: false, foreign_key: true |


belong_to :user
belong_ton:item

   

## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| address              | string | null: false |


has_many :items
has_many :orders

## items

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| explanation        | text   | null: false |
| price              | string | null: false |
| item_situation     | string | null: false|
| category           | string | null: false |
| shipping_day       | string | null: false |
| shipping_location  | string | null: false |
| load               | string | null: false |
| user_id            | string | null: false,foreign_key: true |

has_many :orders
belong_to :user




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
