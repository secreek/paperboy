# The class that processes the HTTP request and give the HTTP response
require 'json'

class Paperboy
  def call env
    request = Rack::Request.new env
    access_key_id = request['AccessKeyId']
    signature = request['Signature']
    request_data = env['rack.input'].read
    request_json = JSON.load request_data

    # Process & Send the message later
    # access_key_id stores the AccessKeyId in protocol
    # signature store the Signature in protocol
    # request_json is the JSON object that stores the data

    Rack::Response.new.finish do |res|
      res['Content-Type'] = 'text/plain'
      res.status = 200
      str = "Hello, World"
      res.write str
    end
  end
end
