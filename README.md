# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| lastname           | string  | null: false               |
| firstname          | string  | null: false               |
| lastname_kana      | string  | null: false               |
| firstname_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           |            |                                |
| itemname        | string     | null: false                    |
| itemdescription | text       | null: false                    |
| category_id     | integer    | null: false                    |
| itemstatus_id   | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| area_info_id    | integer    | null: false                    |
| days_to_send_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| area_info_id   | integer    | null: false                    |
| municipality   | string     | null: false                    |
| house_number   | string     | null: false                    |
| buildingname   | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase