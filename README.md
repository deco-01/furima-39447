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
| password            | string | null: false                         |
| family_name         | string | null: false                         |
| first_name          | string | null: false                         |
| family_name_kana    | string | null: false                         |
| first_name_kana     | string | null: false                         |
| birth_day           | date   | null: false                         |
<!-- | encrypted_password  | string | null: false |
| introduction        | text   |             | -->

### Association

- has_many :item_users
- has_many :items, through: :item_users
- has_one :buyers


## buyers テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| user               | integer| null: false,  foreign_key: true |
| post_code          | string | null: false                     |
| prefecture         | string | null: false                     |
| city               | string | null: false                     |
| address            | string | null: false                     |
| building_name      | string | null: false                     |
| phone_number       | string | null: false                     |

### Association

- belongs_to :user


## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ------ --- | ------------------------------- |
| item_name          | string     | null: false                     |
| item_image         | string     | null: false                     |
| price              | integer    | null: false                     |
| description        | text       | null: false                     |
| category           | string     | null: false                     |
| condition          | string     | null: false                     |
| Delivery Charges   | string     | null: false                     |
| area               | string     | null: false                     |
| handing_time       | string     | null: false                     |
| commission         | string     | null: false                     |
| Sales_profit       | string     | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- has_many :item_users
- has_many :users, through: :item_users


## item_users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user