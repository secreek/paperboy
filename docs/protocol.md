## The Paperboy Protocol

*To be revised very soon*

### Request

#### Schema

##### Endpoint
```
https://paperboy.teamarks.com/newspapers
```

##### HTTP Method

` POST`

##### Data Format

`JSON`

#### Authentication

- None (Cross-domain Rubber)
- HTTP
- API Key
- OAuth

#### Parameters

No parameter require unless using certain authentication method.

#### API Key

- AccessKeyId
- Signature

##### Sample Request (URL)

```
https://paperboy.teamarks.com/newspapers
?AccessKeyId=LKKJDF7RNJDFLKDERTR
&Signature=9GZysQ4Jpnz%2BHklqM7
```

#### JSON Structure

- Protocol: Email, Hipchat, SMS
- Envelope: Sender and Recipients' name and URL
- Message: Title, Body

### Sample Request (JSON)

```json
{
	"email": {
		"sender": {
			"name": "Teamarks",
			"uri": "noreply@teamarks.com"
		},
		"recipients": [
			{
				"name": "hf",
				"uri": "hf@zhanghongfeng.com"
			},
			{
				"name": "vm",
				"uri": "voidmain1313113@gmail.com"
			}
		],
		"message": {
			"title": "Great News!",
			"body": "html email ..."

		},
		"notification":{
			"done": {
				"name": "Cliff Woo",
				"email": "cliffwoo@gmail.com"
			},
			"error": {
				"name": "Cliff Woo",
				"email": "cliffwoo@gmail.com"
			}
		}
	},
	"hipchat": {
		"sender": {
			"name": "Teamarks",
			"uri": "http://api.teamarks.com"
		},
		"recipients": [
			{
				"name": "GoF",
				"uri": "https://api.hipchat.com/chatroom/gof"
			}
		],
		"message": {
			"title": "",
			"body": "plain text, one share per line"

		}
	},
}
```

### Response

*General HTTP response not included*

#### Success

```
HTTP/1.1 200

{"message": "done"}
```

#### Errors

##### Bad JSON

```
 HTTP/1.1 400 Bad Request
 Content-Length: 35

 {"message":"Problems parsing JSON"}
 ```
