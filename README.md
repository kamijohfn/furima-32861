# テーブル設計

## users テーブル
| Column     | Type    | Options                   |
| ---------- | ------- | ------------------------- |
| nickname   | string  | null: false, unique: true |
| email      | string  | null: false, unique: true |
| password   | string  | null: false, unique: true |
| name       | string  | null: false               |
| birthday   | integer | null: false               |

### Association

- has_many :items
- has_many :purchasers

## items テーブル
| Column       | Type       | Options                        |
| ------------ | -----------| -------------------------------|
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| day          | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :purchasers

## purchasers テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchasers
- has_one :deliveries

## deliveries テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchasers    | references | null: false, foreign_key: true |

### Association

- has_one :purchasers