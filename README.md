# テーブル設計

## users テーブル
| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false, unique: true |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false, unique: true |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_ruby      | string  | null: false               |
| last_name_ruby      | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :purchasers

## items テーブル
| Column          | Type       | Options                        |
| ----------------| -----------| -------------------------------|
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| day_id          | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveries テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchasers    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaser