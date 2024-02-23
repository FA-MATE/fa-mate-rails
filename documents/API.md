# Post
## GET /posts.json
- request 쿼리:
  - tag_ids?: string
    예시: 1,2,3
  - category_id?: integer
  - sub_category_id?: integer
  - page?: integer (default = 1)
  - per?: integer (default = 10)

- response: array
  - object
    - id: integer
    - title: string
    - category_id: integer
    - sub_category_id: integer
    - user: object
      - id: integer
      - nickname: string
      - profile_image_url: string
    - tags: array
      - id: integer
      - order_no: integer

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/posts.json
[{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"},{"id":2,"title":null,"category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:38:41.721Z","updated_at":"2024-02-21T15:38:41.721Z"},{"id":3,"title":"새로운 포스트 제목","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:43:58.239Z","updated_at":"2024-02-21T15:43:58.239Z"},{"id":4,"title":"새로운 포스트 제목","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:48:45.875Z","updated_at":"2024-02-21T15:48:45.875Z"}]

$curl -X GET 'https://fa-mate-rails.onrender.com/posts.json?per=1&page=1&tag_ids=1&category_id=1&sub_category_id=1'
[{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"}]%
```

## GET /posts/:post_id.json
- request 파라미터:
  - post_id: integer

- response: object
  - id: integer
  - user: object
    - id: integer
    - nickname: string
    - profile_image_url: string
  - category_id: integer
  - sub_category_id: integer
  - title: string
  - body: string
  - tags: array
    - id: integer
  - conditions: array
    - id: integer
  - created_at: datetime
  - updated_at: datetime

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/posts/1.json
{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"conditions":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"}
```

## POST /posts.json
- request 파라미터: json
  - category_id: integer
  - sub_category_id: integer
  - title: string
  - body: string
  - tags: array
    - id: integer
  - conditions: array
    - id: integer

response: 생성된 post 리소스

```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/posts.json \
  -H 'Content-Type: application/json' \
  -d '{
    "post": {
        "category_id": 1,
        "sub_category_id": 1,
        "title": "새로운 포스트 제목",
        "body": "새로운 포스트 내용",
        "tags": [{"id": 1}, {"id": 2}], 
        "conditions": [{"id": 3}, {"id": 4}]
    }
}'
{"id":4,"category_id":1,"sub_category_id":1,"user_id":1,"title":"새로운 포스트 제목","body":"새로운 포스트 내용","created_at":"2024-02-21T15:48:45.875Z","updated_at":"2024-02-21T15:48:45.875Z"}
```

--- 

# TagGroup
## GET /tag_groups.json
- request 쿼리: 없음

- response: 작성중

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/tag_groups.json
[{"id":1,"name":"地域","order_no":1,"created_at":"2024-02-20T16:23:47.774Z","updated_at":"2024-02-20T16:23:47.774Z"}]
```

## POST /tag_groups.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/tag_groups.json \
  -H 'Content-Type: application/json' \
  -d '{
    "tag_group": {
        "name": "태그 그룹 이름",
        "order_no": 1
    }
}'
{"id":2,"name":"태그 그룹 이름","order_no":1,"created_at":"2024-02-23T09:36:55.363Z","updated_at":"2024-02-23T09:36:55.363Z"}
```

## PUT /tag_groups/:tag_group_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/tag_groups/2.json \
  -H 'Content-Type: application/json' \
  -d '{
    "tag_group": {
        "name": "태그 그룹 새 이름",
        "order_no": 2
    }
}'
{"name":"태그 그룹 새 이름","order_no":2,"id":2,"created_at":"2024-02-23T09:36:55.363Z","updated_at":"2024-02-23T09:37:26.378Z"}
```

---
# Tag
## GET /tags.json
- request 쿼리: 없음

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer
      - tag_group: object
        - id: integer
        - name: string
        - order_no: integer

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/tags.json
[{"id":1,"name":"東京都","order_no":1,"tag_group":{"id":1,"name":1,"order_no":1}}]
```

## POST /tags.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/tags.json \
  -H 'Content-Type: application/json' \
  -d '{
    "tag": {
        "tag_group_id": 1,
        "name": "태그 이름",
        "order_no": 1
    }
}'
{"id":2,"tag_group_id":1,"name":"태그 이름","order_no":1,"created_at":"2024-02-23T09:35:13.059Z","updated_at":"2024-02-23T09:35:13.059Z"}
```

## PUT /tags/:tag_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/tags/2.json \
  -H 'Content-Type: application/json' \
  -d '{
    "tag": {
        "name": "태그 새 이름",
        "order_no": 2
    }
}'
{"name":"태그 새 이름","order_no":2,"tag_group_id":1,"id":2,"created_at":"2024-02-23T09:35:13.059Z","updated_at":"2024-02-23T09:35:26.192Z"}
```

---

# ConditionGroup
## GET /condition_groups.json
- request 쿼리: 없음

- response: 작성중

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/condition_groups.json
[{"id":1,"name":"居住","order_no":null,"created_at":"2024-02-20T16:23:47.742Z","updated_at":"2024-02-20T16:23:47.742Z"}]
```

## POST /condition_groups.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/condition_groups.json \
  -H 'Content-Type: application/json' \
  -d '{
    "condition_group": {
        "name": "조건 그룹 이름",
        "order_no": 1
    }
}'
{"id":2,"name":"조건 그룹 이름","order_no":1,"created_at":"2024-02-23T09:38:52.746Z","updated_at":"2024-02-23T09:38:52.746Z"}
```

## PUT /condition_groups/:condition_group_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/condition_groups/2.json \
  -H 'Content-Type: application/json' \
  -d '{
    "condition_group": {
        "name": "조건 그룹 새 이름",
        "order_no": 2
    }
}'
{"name":"조건 그룹 새 이름","order_no":2,"id":2,"created_at":"2024-02-23T09:38:52.746Z","updated_at":"2024-02-23T09:39:05.408Z"}
```

---
# Condition
## GET /conditions.json
- request 쿼리: 없음

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer
      - condition_group: object
        - id: integer
        - name: string
        - order_no: integer

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/conditions.json
[{"id":1,"name":"条件無し","order_no":1,"condition_group":{"id":1,"name":1,"order_no":1}}]
```

## POST /conditions.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/conditions.json \
  -H 'Content-Type: application/json' \
  -d '{
    "condition": {
        "condition_group_id": 1,
        "name": "조건 이름",
        "order_no": 1
    }
}'
{"id":2,"condition_group_id":1,"name":"조건 이름","order_no":1,"created_at":"2024-02-23T09:39:48.069Z","updated_at":"2024-02-23T09:39:48.069Z"}
```

## PUT /conditions/:condition_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/conditions/2.json \
  -H 'Content-Type: application/json' \
  -d '{
    "condition": {
        "name": "조건 새 이름",
        "order_no": 2
    }
}'
{"name":"조건 새 이름","order_no":2,"condition_group_id":1,"id":2,"created_at":"2024-02-23T09:39:48.069Z","updated_at":"2024-02-23T09:39:58.510Z"}
```

----
# Category
## GET /categories.json
- request 쿼리: 없음

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/categories.json
[{"id":1,"name":"ペット","order_no":1}]
```

## POST /categories.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/categories.json \
  -H 'Content-Type: application/json' \
  -d '{
    "category": {
        "name": "카테고리 이름",
        "order_no": 1
    }
}'
{"id":2,"name":"카테고리 이름","order_no":1,"created_at":"2024-02-23T09:23:47.977Z","updated_at":"2024-02-23T09:23:47.977Z"}
```

## PUT /categories/:category_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/categories/2.json \
  -H 'Content-Type: application/json' \
  -d '{
    "category": {
        "name": "카테고리 새 이름",
        "order_no": 2
    }
}'
{"name":"카테고리 새 이름","order_no":2,"id":2,"created_at":"2024-02-23T09:23:47.977Z","updated_at":"2024-02-23T09:24:07.689Z"}
```

----
# SubCategory
## GET /category/:category_id/sub_categories.json
- request 파라미터:
  - category_id: integer

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer

```sh
$ curl -X GET https://fa-mate-rails.onrender.com/categories/1/sub_categories.json
[{"id":1,"name":"犬","order_no":1},{"id":2,"name":"猫","order_no":2}]
```

## POST /sub_categories.json
```sh
$ curl -X POST \
  https://fa-mate-rails.onrender.com/sub_categories.json \
  -H 'Content-Type: application/json' \
  -d '{
    "sub_category": {
        "category_id": 1,
        "name": "서브카테고리 이름",
        "order_no": 1
    }
}'
{"id":3,"category_id":1,"name":"서브카테고리 이름","order_no":1,"created_at":"2024-02-23T09:21:56.877Z","updated_at":"2024-02-23T09:21:56.877Z"}
```

## PUT /sub_categories/:sub_category_id.json
```sh
$ curl -X PUT \
  https://fa-mate-rails.onrender.com/sub_categories/3.json \
  -H 'Content-Type: application/json' \
  -d '{
    "sub_category": {
        "name": "서브카테고리 새 이름",
        "order_no": 2
    }
}'
{"name":"서브카테고리 새 이름","order_no":2,"category_id":1,"id":3,"created_at":"2024-02-23T09:21:56.877Z","updated_at":"2024-02-23T09:22:56.958Z"}
```
