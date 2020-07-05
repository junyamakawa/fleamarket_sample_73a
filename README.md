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
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_number|string|null: false, unique: true|
|introduction|text|null: false|

### Association
- has_many :products, dependent :destroy
- has_many :credit_cards, dependent :destroy
- has_many :orders, dependent :destroy
- has_many :destinations, dependent :destroy

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand|string|
|condition_id(active_hash)|references|null: false, foreign_key: true|
|delivery_cost|integer|null: false|
|region_id(active_hash)|references|null: false, foreign_key: true|
|preparation_day_id(active_hash)|references|null: false, foreign_key: true|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order
- has_many :images, dependent :destroy
- belongs_to :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :region

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belongs_to :product

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|

### Association
- has_many :products

## Conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association

##  Preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|integer|null: false|

### Association

##  Regionsテーブル
|Column|Type|Options|
|------|----|-------|
|region|string|null: false|

### Association

## credit_cardテーブル
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
|destination_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

  ### Association
  - belongs_to :user
  - has_one :product
  - has_one :destination

## destinationテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||

  ### Association
  - belongs_to :user
  - has_one :order

