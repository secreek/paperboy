# The class that processes the HTTP request and give the HTTP response
require 'json'
require 'digest/md5'

require './helpers/validators'
require './worker'

class Paperboy
  attr_accessor :status, :response_body

  def call env
    request = Rack::Request.new env
    access_key_id = request['AccessKeyId']
    signature = request['Signature']
    request_data = env['rack.input'].read
    begin
      request_json = JSON.load request_data
    rescue
      request_json = nil
    end

    # TODO test access_key_id against signature
    # access_key_id stores the AccessKeyId in protocol
    # signature store the Signature in protocol

    # request_json is the JSON object that stores the data
    # Only process the message if request_json is valid
    # (validator defined in ./helpers/validators.rb,
    # and mixed-in with Object)
    if request_json.is_valid_pb_work
      # Generate a unique id, save the request in the queue,
      # and let the worker process them one by one later
      id = gen_msg_id request_json
      complete_job = {
        :job_id => id,
        :material => request_json
      }
      Worker.new_job complete_job
      @status = 200
      @response_body = {
        :id => id,
        :message => "Got your paper"
      }
    elsif request_json # is not nil
      # Invalid request parameters
      @status = 400
      @response_body = {
        :message => "Request body does not conform to paperboy protocol"
      }
    else
      # Problems from JSON parsing
      @status = 400
      @response_body = {
        :message => "Problems parsing JSON, invalid JSON format probabily"
      }
    end

    Rack::Response.new.finish do |res|
      res['Content-Type'] = 'text/plain'
      res.status = @status
      str = JSON.dump @response_body
      res.write str
    end
  end

  # Helper methods
  def gen_msg_id json_object
    Digest::MD5.hexdigest("#{JSON.dump json_object}/#{Time.now.to_s}")
  end
end
