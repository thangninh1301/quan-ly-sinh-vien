## POST /api/v1/admin/sign_in
Request should succeed.

### Example

#### Request
```
POST /api/v1/admin/sign_in HTTP/1.1
Content-Length: 44
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "email": "test11@example.com",
  "password": "aaaa1234"
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
access-token: uNqEnD-VeTrnmdqdCORuRA
client: yJhWBxEgzNsqIb72nJZ-Ag
expiry: 1548720000
token-type: Bearer
uid: test11@example.com

{
  "success": true,
  "data": {
    "id": 11,
    "email": "test11@example.com",
    "uid": "test11@example.com",
    "provider": "email",
    "name": "Admin",
    "allow_password_change": false,
    "image": null
  },
  "screen": "admin"
}
```
## POST /api/v1/admin/sign_in
Request should failed.

### Example

#### Request
```
POST /api/v1/admin/sign_in HTTP/1.1
Content-Length: 39
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
  "email": "test12@example.com",
  "password": "bug"
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
    "ログイン用の認証情報が正しくありません。再度お試しください。"
  ]
}
```
## DELETE /api/v1/admin/sign_out
Sign out success.

### Example

#### Request
```
DELETE /api/v1/admin/sign_out HTTP/1.1
Access-Token: 8ankx32nFwfJzIQVo9fIog
Client: _sXDU4xw4ZYICtHUh-ibcw
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Expiry: 1548720000
Host: test.host
Token-Type: Bearer
Uid: test13@example.com
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

{
  "success": true
}
```
## DELETE /api/v1/admin/sign_out
Sign out failed.

### Example

#### Request
```
DELETE /api/v1/admin/sign_out HTTP/1.1
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: test.host
User-Agent: Rails Testing

{
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
    "ユーザーが見つからないか、ログインしていません。"
  ]
}
```
