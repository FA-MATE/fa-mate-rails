## GET /posts
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
$ curl -X GET http://localhost:3000/posts.json
[{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"},{"id":2,"title":null,"category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:38:41.721Z","updated_at":"2024-02-21T15:38:41.721Z"},{"id":3,"title":"새로운 포스트 제목","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:43:58.239Z","updated_at":"2024-02-21T15:43:58.239Z"},{"id":4,"title":"새로운 포스트 제목","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[],"created_at":"2024-02-21T15:48:45.875Z","updated_at":"2024-02-21T15:48:45.875Z"}]

$curl -X GET 'http://localhost:3000/posts.json?per=1&page=1&tag_ids=1&category_id=1&sub_category_id=1'
[{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"}]%
```

----
## GET /posts/:post_id
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
$ curl -X GET http://localhost:3000/posts/1.json
{"id":1,"title":"テストタイトル","category_id":1,"sub_category_id":1,"user":{"id":1,"nickname":"テストユーザ","profile_image_url":null},"tags":[{"id":1}],"conditions":[{"id":1}],"created_at":"2024-02-20T16:23:47.809Z","updated_at":"2024-02-20T16:23:47.809Z"}
```
----
## POST /posts
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
  http://localhost:3000/posts.json \
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

----
## GET /tags
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
$ curl -X GET http://localhost:3000/tags.json
[{"id":1,"name":"東京都","order_no":1,"tag_group":{"id":1,"name":1,"order_no":1}}]
```
----
## GET /conditions
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
$ curl -X GET http://localhost:3000/conditions.json
[{"id":1,"condition_group_id":1,"name":"条件無し","order_no":1,"created_at":"2024-02-20T16:23:47.758Z","updated_at":"2024-02-20T16:23:47.758Z"}]
```


----
## GET /categories.json
- request 쿼리: 없음

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer

```sh
$ curl -X GET http://localhost:3000/categories.json
[{"id":1,"name":"ペット","order_no":1}]
```
----
## GET /category/:category_id/sub_categories
- request 파라미터:
  - category_id: integer

- response: array
  - object
    - id: integer
    - name: string
    - order_no: integer

```sh
$ curl -X GET http://localhost:3000/categories/1/sub_categories.json
[{"id":1,"name":"犬","order_no":1},{"id":2,"name":"猫","order_no":2}]
```