<!-- # README

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

* ... -->


# テーブル設計

## users テーブル

| Column              | Type   | Options                             |
| ------------------- | ------ | ----------------------------------- |
| nickname            | string | null: false                         |
| email               | string | null: false                         |
| encrypted_password  | string | null: false                         |
| family_name         | string | null: false                         |
| first_name          | string | null: false                         |
| family_name_kana    | string | null: false                         |
| first_name_kana     | string | null: false                         |
| birth_day           | date   | null: false                         |

### Association

- has_many :item_users
- has_one :buyers


## buyers テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| post_code          | string | null: false                     |
| prefecture         | string | null: false                     |
| city               | string | null: false                     |
| address            | string | null: false                     |
| building_name      | string |                                 |
| phone_number       | string | null: false                     |
| item_user_id       | bigint | null: false, foreign_key: true  |


### Association

- belongs_to :item_users


## items テーブル

| Column              | Type       | Options                         |
| ------------------  | ------ --- | ------------------------------- |
| item_name           | string     | null: false                     |
| price               | integer    | null: false                     |
| description         | text       | null: false                     |
| price_preservation  | string     | null: false                     |
| user_id             | references | null: false, foreign_key: true  |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charges_id | integer    | null: false                     |
| area_id             | integer    | null: false                     |
| handing_time_id     | integer    | null: false                     |


### Association

- has_one :item_users
- belongs_to :users


## item_users テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| item_id             | references | null: false, foreign_key: true |
| user_id             | references | null: false, foreign_key: true |
| buyer_id            | references | null: false, foreign_key: true |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charges_id | integer    | null: false                     |
| area_id             | integer    | null: false                     |
| handing_time_id     | integer    | null: false                     |


### Association

- belongs_to :item
- belongs_to :user
- has_many :buyer