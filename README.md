# README




## order

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user_address   | references | null: false, foreign_key: true |
| items_price       | references | null: false, foreign_key: true |


belong_to :user
belong_to :item


   

## users

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false,unique: true |
| email                | string | null: false |
|encysted_password     | string | null: false |      <!---不足->


has_many :items
has_many :orders

## items

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| name                 | string      | null: false |
| explanation          | text        | null: false |
| price                | integer     | null: false |
| category＿id         | string      | null: false |
| user_name            | references  | null: false,foreign_key: true | <!--外部キーと名前を修正-->

has_one :orders
belong_to :user
belong_to :addresses


## Address

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| card_number          | integer     | null: false |
| date_of_expiry       | integer     | null: false |
| security＿code       | integer     | null: false |
| postal_code          | string      | null: false |
| prefecture           | string        | null: false |
| city                 | string     | null: false |
| address              | string      | null: false |
| building             | string        | null: false |
| phone_number         | string      | null: false |
| order_id             | references  | null: false,foreign_key: true |



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:   address  buliding


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
