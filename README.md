# テーブル設計

## users テーブル

| Column        | Type    | Options    |
|------         |----     |-------     |
| nickname      | string  | null:false |
| email         | string  | null:false, unique:true |
| password      | string  | null:false |
| last_name     | string  | null:false |
| first_name    | string  | null:false |
| last_name_jp  | string  | null:false |
| first_name_jp | string  | null:false |
| birth_y       | integer | null:false |
| birth_m       | integer | null:false |
| birth_d       | integer | null:false |

### Association
- has_many :items
- has_many :shippings
- has_many :comments
- has_many :likes

## items テーブル

| Column        | Type       | Options    |
|------         |----        |-------     |
| image         |            | null:false |
| product_name  | string     | null:false |
| description   | text       | null:false |
| category      | string     | null:false |
| brand         | string     |            |
| condition     | string     | null:false |
| delivery_type | string     | null:false |
| delivery_area | string     | null:false |
| delivery_days | integer    | null:false |
| price         | integer    | null:false |
| user_id       | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- has_one :shipping
- has_many :comments
- has_many :likes

## comments テーブル

| Column        | Type       | Options    |
|------         |----        |-------     |
| text          | string     | null:false |
| user_id       | references | null:false, foreign_key:true |
| item_id       | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item

## likes テーブル

| Column        | Type       | Options    |
|------         |----        |-------     |
| like          | string     | null:false |
| user_id       | references | null:false, foreign_key:true |
| item_id       | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item

## shippings テーブル

| Column             | Type       | Options    |
|------              |----        |-------     |
| postcode           | integer    | null:false |
| address_prefecture | string     | null:false |
| address_city       | string     | null:false |
| address_street     | string     | null:false |
| address_other      | string     |            |
| phone_num          | string     | null:false |
| user_id            | references | null:false, foreign_key:true |
| item_id            | references | null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item