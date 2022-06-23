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

| Column                 | Type       | Options    |
|------                  |----        |-------     |
| product_name           | string     | null:false |
| description            | text       | null:false |
| category_id            | integer    | null:false |
| condition_id           | integer    | null:false |
| delivery_charge_id     | integer    | null:false |
| prefecture_id          | integer    | null:false |
| days_until_delivery_id | integer    | null:false |
| price                  | integer    | null:false |
| user                   | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments
- has_many :likes
- belongs_to :category
- belongs_to :condition
- belongs_to :delivery_charge
- belongs_to :prefecture
- belongs_to :days_until_delivery

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
| postcode              | string     | null:false |
| prefecture_id         | integer    | null:false |
| city                  | string     | null:false |
| street                | string     | null:false |
| address_other         | string     |            |
| phone_num             | string     | null:false |
| purchase              | reference  | null:false |

### Association
- belongs_to :purchase