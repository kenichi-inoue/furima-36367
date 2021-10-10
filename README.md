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

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| user_name            | string | null: false |
| user_katakana_name   | string | null: false |
| birth_date           | string | null: false |

### Association

- has_many :products
- has_many :ships

## products テーブル

| Column              | Type       | Options           |
| ---------           | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_discription | text       | null: false       |
| product_category    | string     | null: false       |
| shipping burden     | string     | null: false       |
| shipping area       | string     | null: false       |
| days_to_ship        | string     | null: false       |
| purchase_price      | string     | null: false       |
| user                | references |                   |
| purchase            | references |                   |

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
| street      | text       | null: false      |
| building    | text       | null: false      |
| phone       | string     | null: false      |
| user        | references |                  |
| purchase    | references |                  |

### Association

- belongs_to :user
- belongs_to :purchase
