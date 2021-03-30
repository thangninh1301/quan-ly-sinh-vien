## PATCH /api/v1/admin/administrators/:id
Return error.

### Example

#### Request
```
PATCH /api/v1/admin/administrators/1 HTTP/1.1
Content-Length: 74
Content-Type: application/x-www-form-urlencoded
Host: test.host
Uid: invalid
User-Agent: Rails Testing

{
  "administrator": {
    "email": "admin@example.com",
    "name": "Admin"
  },
  "id": "1"
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
  "errors": [
    "アカウント登録もしくはログインしてください。"
  ]
}
```
## PATCH /api/v1/admin/administrators/:id
Update profile success.

### Example

#### Request
```
PATCH /api/v1/admin/administrators/2 HTTP/1.1
Access-Token: VIV1JrvI-jC03SEK8QUcsQ
Client: IaZwceG1z73GJkOELjKKwQ
Content-Length: 74
Content-Type: application/x-www-form-urlencoded
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test2@example.com
User-Agent: Rails Testing

{
  "administrator": {
    "email": "admin@example.com",
    "name": "Admin"
  },
  "id": "2"
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
access-token: VIV1JrvI-jC03SEK8QUcsQ
client: IaZwceG1z73GJkOELjKKwQ
expiry: 1548720000
token-type: Bearer
uid: admin@example.com

{
  "success": true,
  "data": {
    "id": 2,
    "email": "admin@example.com",
    "name": "Admin",
    "uid": "admin@example.com",
    "provider": "email"
  }
}
```
## PATCH /api/v1/admin/administrators/:id
Response success.

### Example

#### Request
```
PATCH /api/v1/admin/administrators/3 HTTP/1.1
Access-Token: k8V1wypnA5TP5poocmHHQw
Client: g45WJ0zjJ7wRP8bpd_wWXQ
Content-Length: 86
Content-Type: application/x-www-form-urlencoded
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test3@example.com
User-Agent: Rails Testing

{
  "administrator": {
    "password": "aaaa1234",
    "password_confirmation": "aaaa1234"
  },
  "id": "3"
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
access-token: k8V1wypnA5TP5poocmHHQw
client: g45WJ0zjJ7wRP8bpd_wWXQ
expiry: 1548720000
token-type: Bearer
uid: test3@example.com

{
  "success": true,
  "data": {
    "id": 3,
    "email": "test3@example.com",
    "name": "Admin",
    "uid": "test3@example.com",
    "provider": "email"
  }
}
```
## PATCH /api/v1/admin/administrators/:id
Response error.

### Example

#### Request
```
PATCH /api/v1/admin/administrators/4 HTTP/1.1
Access-Token: TGgl6xhS3luFsCJKUjvuOQ
Client: 9askANM-w7m3f3ZbIfgerQ
Content-Length: 98
Content-Type: application/x-www-form-urlencoded
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test4@example.com
User-Agent: Rails Testing

{
  "administrator": {
    "password": "aaaa1234",
    "password_confirmation": "invalid confirmation"
  },
  "id": "4"
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
access-token: TGgl6xhS3luFsCJKUjvuOQ
client: 9askANM-w7m3f3ZbIfgerQ
expiry: 1548720000
token-type: Bearer
uid: test4@example.com

{
  "success": false,
  "errors": {
    "password_confirmation": [
      "パスワードの入力が一致しません。"
    ]
  }
}
```
## PATCH /api/v1/admin/administrators/:id
Error.

### Example

#### Request
```
PATCH /api/v1/admin/administrators/5 HTTP/1.1
Access-Token: TqFHYiz_cVbbj24-DYZJGQ
Client: 70dUEwmLWzX8DSnnjDacjg
Content-Length: 69
Content-Type: application/x-www-form-urlencoded
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test5@example.com
User-Agent: Rails Testing

{
  "administrator": {
    "email": "admin@example.com",
    "name": ""
  },
  "id": "5"
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
access-token: TqFHYiz_cVbbj24-DYZJGQ
client: 70dUEwmLWzX8DSnnjDacjg
expiry: 1548720000
token-type: Bearer
uid: test5@example.com

{
  "success": false,
  "errors": {
    "name": [
      "入力は必須です。"
    ]
  }
}
```
## GET /api/v1/admin/administrators/me
Return error.

### Example

#### Request
```
GET /api/v1/admin/administrators/me HTTP/1.1
Host: test.host
Uid: invalid
User-Agent: Rails Testing

{
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
  "errors": [
    "アカウント登録もしくはログインしてください。"
  ]
}
```
## GET /api/v1/admin/administrators/me
Return administrator info.

### Example

#### Request
```
GET /api/v1/admin/administrators/me HTTP/1.1
Access-Token: ZH3ltwOBulj83A_xOiXhig
Client: cFRi_t5OUAQOnn8GhYcPAA
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test6@example.com
User-Agent: Rails Testing

{
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
access-token: ZH3ltwOBulj83A_xOiXhig
client: cFRi_t5OUAQOnn8GhYcPAA
expiry: 1548720000
token-type: Bearer
uid: test6@example.com

{
  "success": true,
  "data": {
    "id": 6,
    "email": "test6@example.com",
    "name": "Admin",
    "uid": "test6@example.com",
    "provider": "email"
  }
}
```
