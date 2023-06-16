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
| email               | string | null: false, unique: true           |
| encrypted_password  | string | null: false                         |
| family_name         | string | null: false                         |
| first_name          | string | null: false                         |
| family_name_kana    | string | null: false                         |
| first_name_kana     | string | null: false                         |
| birth_day           | date   | null: false                         |

### Association

- has_many :items
- has_many :orders


## buyers テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| post_code          | string     | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| order              | references | null: false, foreign_key: true  |


### Association

- belongs_to :order


## items テーブル

| Column              | Type       | Options                         |
| ------------------  | ------ --- | ------------------------------- |
| name                | string     | null: false                     |
| price               | integer    | null: false                     |
| description         | text       | null: false                     |
| user                | references | null: false, foreign_key: true  |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charge_id  | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| handing_time_id     | integer    | null: false                     |


### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer