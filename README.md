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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true, index: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_number|integer|null: false, unique: true|
|introduction|string|null: false|

### Association
- has_many :products
- has_many :credit_cards
- has_many :orders

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|description|text|null: false|
|category|string|null: false|
|brand|string|
|condition|text|null: false|
|delivery_cost|integer|null: false|
|region|string|null: false|
|preparation_day|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has one :order

## credit-cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## orderテーブル
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_card|integer|null: false|
|prefecture|string|null: false|
|dity|string|null: false|
|house_number|string|null: false|
|building_name|string||
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - has one :product
