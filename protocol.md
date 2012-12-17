## The Paperboy Protocol

*To be revised very soon*

### Sample

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