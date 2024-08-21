# README


## users

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false,unique: true |
| encysted_password    | string | null: false |  
| birthday             | date   | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |    



has_many :items
has_many :orders
has_many :addresses

## items

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| name                 | string      | null: false |
| explanation          | text        | null: false |
| price                | integer     | null: false |
| user                 | references  | null: false,foreign_key: true |
| item_situation_id     | integer | null: false|
| category_id           | integer | null: false |
| shipping_day_id       | integer | null: false |
| shipping_location_id  | integer | null: false |
| load_id               | integer | null: false |


has_one :order
belong_to :user



## orders

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| image          | text       | null: false,foreign_key: true |





belong_to :user
belong_to :item
has_one :address

## Addresses

| Column               | Type        | Options     |
| -----------------    | ------      | ----------- |
| postal_code          | string      | null: false |
| prefecture_id        | integer      | null: false |
| city                 | string      | null: false |
| address              | string      | null: false |
| building             | string      |             |
| phone_number         | string      | null: false |
| order                | references  | null: false,foreign_key: true |

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
