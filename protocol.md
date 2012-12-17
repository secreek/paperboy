## The Paperboy Protocol

*To be revised very soon*

### Request

#### Schema

##### Endpoint
```
http://paperboy.teamarks.com/newspapers
```

##### HTTP Method

` POST`

##### Data Format

`JSON`

#### Parameters

*none*

#### Authentication

- None (Cross-domain Rubber)
- HTTP
- API Key
- OAuth

#### JSON Structure

- Protocol: Email, Hipchat, SMS
- Envelope: Sender and Recipients' name and URL
- Message: Title, Body

### Sample Request

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

{"message_id": 1001}
```

#### Errors

##### Bad JSON

```
 HTTP/1.1 400 Bad Request
 Content-Length: 35

 {"message":"Problems parsing JSON"}
 ```