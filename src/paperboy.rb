# The class that processes the HTTP request and give the HTTP response
require 'json'

class Paperboy
  attr_accessor :status, :message

  def call env
    request = Rack::Request.new env
    access_key_id = request['AccessKeyId']
    signature = request['Signature']
    request_data = env['rack.input'].read
    begin
      request_json = JSON.load request_data
    rescue
      request_json = nil
      @status = 400
      @message = "Problems parsing JSON"
    end

    # TODO test access_key_id against signature

    # Only process the message if request_json is not nil
    if request_json
      # Process & Send the message later
      # access_key_id stores the AccessKeyId in protocol
      # signature store the Signature in protocol
      # request_json is the JSON object that stores the data
    end

    Rack::Response.new.finish do |res|
      res['Content-Type'] = 'text/plain'
      res.status = @status
      str = @message
      res.write str
    end
  end
end
