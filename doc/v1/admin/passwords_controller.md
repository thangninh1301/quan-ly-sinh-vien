## POST /api/v1/admin/password
Request should succeed.

### Example

#### Request
```
POST /api/v1/admin/password HTTP/1.1
Content-Length: 67
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "email": "test7@example.com",
  "redirect_url": "http://host.com/home"
}
```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": true,
  "message": "'test7@example.com' にパスワードリセットの案内が送信されました。"
}
```
## POST /api/v1/admin/password
Request should failed.

### Example

#### Request
```
POST /api/v1/admin/password HTTP/1.1
Content-Length: 60
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "email": "test@gmail",
  "redirect_url": "http://host.com/home"
}
```

#### Response
```
HTTP/1.1 404
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": false,
  "errors": [
    "メールアドレス 'test@gmail' のユーザーが見つかりません。"
  ]
}
```
## GET /api/v1/admin/password/edit
Request should succeed.

### Example

#### Request
```
GET /api/v1/admin/password HTTP/1.1
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "redirect_url": "http://host.com/home",
  "reset_password_token": "vvYPGZrm7LKFqhupuqzo"
}
```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": true,
  "data": {
    "reset_password_token": "vvYPGZrm7LKFqhupuqzo"
  }
}
```
## GET /api/v1/admin/password/edit
Request should failed.

### Example

#### Request
```
GET /api/v1/admin/password/edit HTTP/1.1
Host: test.host
User-Agent: Rails Testing

{
  "redirect_url": "http://host.com/home",
  "reset_password_token": "test"
}
```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": false,
  "errors": [
    "トークンが不正な値です。"
  ]
}
```
## PATCH /api/v1/admin/password
Request should succeed.

### Example

#### Request
```
PATCH /api/v1/admin/password HTTP/1.1
Content-Length: 90
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "password": "aaaa1234",
  "password_confirmation": "aaaa1234",
  "reset_password_token": "i28VvP81h636GcEZKirc"
}
```

#### Response
```
HTTP/1.1 200
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": true,
  "data": {
    "id": 9,
    "provider": "email",
    "email": "test9@example.com",
    "uid": "test9@example.com",
    "allow_password_change": false,
    "name": "Admin",
    "image": null,
    "created_at": "2019-01-15T00:00:00.000Z",
    "updated_at": "2019-01-15T00:00:00.000Z"
  },
  "message": "パスワードの更新に成功しました。"
}
```
## PATCH /api/v1/admin/password
Reset password token failed.

### Example

#### Request
```
PATCH /api/v1/admin/password HTTP/1.1
Content-Length: 74
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "password": "aaaa1234",
  "password_confirmation": "aaaa1234",
  "reset_password_token": "test"
}
```

#### Response
```
HTTP/1.1 401
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": false,
  "errors": [
    [
      "トークンが不正な値です。"
    ]
  ]
}
```
## PATCH /api/v1/admin/password
Password validation failed.

### Example

#### Request
```
PATCH /api/v1/admin/password HTTP/1.1
Content-Length: 88
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "password": "aaaa12",
  "password_confirmation": "aaaa1234",
  "reset_password_token": "bkNGNMfcJ2EE_gyd1kxQ"
}
```

#### Response
```
HTTP/1.1 422
Content-Type: application/json; charset=utf-8
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-XSS-Protection: 1; mode=block

{
  "success": false,
  "errors": {
    "password_confirmation": [
      "パスワードの入力が一致しません。"
    ],
    "password": [
      "8文字以上、英文字と数字をそれぞれ1文字以上"
    ],
    "full_messages": [
      "パスワード（確認用）：パスワードの入力が一致しません。",
      "パスワード：8文字以上、英文字と数字をそれぞれ1文字以上"
    ]
  }
}
```
