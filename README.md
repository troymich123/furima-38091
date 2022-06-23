# テーブル設計

## users テーブル

| Column                  | Type    | Options    |
|------                   |----     |-------     |
| nickname                | string  | null:false |
| email                   | string  | null:false, unique:true |
| encrypted_password      | string  | null:false |
| last_name               | string  | null:false |
| first_name              | string  | null:false |
| last_name_jp            | string  | null:false |
| first_name_jp           | string  | null:false |
| birthday                | date    | null:false |

### Association
- has_many :items
- has_many :purchases
- has_many :comments
- has_many :likes

## items テーブル

| Column           | Type       | Options    |
|------            |----        |-------     |
| image            |            | null:false |
| product_name     | string     | null:false |
| description      | text       | null:false |
| category_id      | integer    | null:false, active_hash |
| condition_id     | integer    | null:false, active_hash |
| delivery_type_id | integer    | null:false, active_hash |
| delivery_area_id | integer    | null:false, active_hash |
| delivery_day_id  | integer    | null:false, active_hash |
| price            | integer    | null:false |
| user             | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments
- has_many :likes
- belongs_to :category
- belongs_to :condition
- belongs_to :delivery_type
- belongs_to :delivery_area
- belongs_to :delivery_day

## purchases テーブル
| Column        | Type       | Options    |
|------         |----        |-------     |
| user          | references | null:false, foreign_key:true |
| item          | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column        | Type       | Options    |
|------         |----        |-------     |
| text          | string     | null:false |
| user          | references | null:false, foreign_key:true |
| item          | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item

## likes テーブル

| Column        | Type       | Options    |
|------         |----        |-------     |
| like          | string     | null:false |
| user          | references | null:false, foreign_key:true |
| item          | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item

## shipments テーブル

| Column                | Type       | Options    |
|------                 |----        |-------     |
| postcode              | integer    | null:false |
| address_prefecture_id | integer    | null:false, active_hash |
| address_city          | string     | null:false |
| address_street        | string     | null:false |
| address_other         | string     |            |
| phone_num             | string     | null:false |
| purchase              | reference  | null:false |

### Association
- belongs_to :purchase
- belongs_to :address_prefecture