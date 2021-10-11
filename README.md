# README

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

# テーブル設計

## users テーブル

| Column                      | Type   | Options                    |
| ------------------          | ------ | -----------                |
| nickname                    | string | null: false                |
| email                       | string | null: false , unique: true |
| encrypted_password          | string | null: false                |
| user_family_name            | string | null: false                |
| user_first_name             | string | null: false                |
| katakana_user_family_name   | string | null: false                |
| katakana_user_first_name    | string | null: false                |
| birthday                    | date   | null: false                |

### Association

- has_many :products
- has_many :ships

## products テーブル

| Column                 | Type       | Options           |
| ---------              | ---------- | ----------------- |
| product_name           | string     | null: false       |
| product_discription    | text       | null: false       |
| product_category_id    | integer    | null: false       |
| shipping burden_id     | integer    | null: false       |
| shipping area_id       | integer    | null: false       |
| days_to_ship_id        | integer    | null: false       |
| purchase_price         | integer    | null: false       |
| user                   | references |                   |
| purchase               | references |                   |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| card_number | string     | null: false      |
| exp_month   | string     | null: false      |
| exp_year    | string     | null: false      |
| user        | references |                  |

### Association

- belongs_to :user
- has_one :ship

## ships テーブル

| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| postal_code | string     | null: false      |
| prefecture  | string     | null: false      |
| city        | string     | null: false      |
| street      | string     | null: false      |
| building    | string     |                  |
| phone       | string     | null: false      |
| purchase    | references | foreign_key: true|

### Association

- belongs_to :user
- belongs_to :purchase
