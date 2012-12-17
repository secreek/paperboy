# The class that processes the HTTP request and give the HTTP response

class Paperboy
  def call env
    request = Rack::Request.new env

    Rack::Response.new.finish do |res|
      res['Content-Type'] = 'text/plain'
      res.status = 200
      str = "Hello, World"
      res.write str
    end
  end
end
