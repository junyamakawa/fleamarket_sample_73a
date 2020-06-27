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
|email|string|null: false, unique: true|
|name-kanji|string|null: false|
|name-katakana|string|null: false|
|birth-of-date|integer|null: false|
|telephone|integer|null: false|

### Association
- has_many :products
- has_many :credit-cards
- has_many :orders

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|description|text|null: false|
|category-classification|string|null: false|
|brand-classification|string|
|condition|string|null: false|
|delivery-cost|integer|null: false|
|ship-from location|string|null: false|
|schedule-until-shipping|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :order

## credit-cardテーブル
|Column|Type|Options|
|------|----|-------|
|card-number|integer|null: false, unique: true|
|expiration-date|integer|null: false|
|security-code|integer|null: false|
|card-name|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## orderテーブル
|Column|Type|Options|
|------|----|-------|
|shipping-address|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - belongs_to :product
