# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   |             |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :tasks
- has_many :comments

## tasks テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |  
| title      | string     | null: false       | 
| description|  text      | null: false       | 
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| task      | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :task

