# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| lastname           | string  | null: false |
| firstname          | string  | null: false |
| lastname_kana      | string  | null: false |
| firstname_kana     | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| image           |            |             | 
| itemname        | string     | null: false |
| itemdescription | text       | null: false |
| category        | integer    | null: false |
| itemstatus      | integer    | null: false |
| burden          | integer    | null: false |
| area_info       | integer    | null: false |
| days_to_send    | integer    | null: false |
| area_info       | integer    | null: false |
| price           | integer    | null: false |
| user_id         | references | null: false |

## purchases テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| purchase_record | integer    |             |
| user_id         | references | null: false |
| item_id         | references | null: false |

## shipping_addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | integer    | null: false |
| expiry_month   | integer    | null: false |
| expiry_year    | integer    | null: false |
| security_code  | integer    | null: false |
| postal_code    | string     | null: false |
| prefectures    | integer    | null: false |
| municipalities | string     | null: false |
| house_number   | string     | null: false |
| buildingname   | string     |             |
| phone_number   | string     | null: false |
| purchase_id    | references | null: false |
