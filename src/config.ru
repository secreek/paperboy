require './paperboy'
require './worker'

Worker.turn_on

rack_app = Rack::Builder.new do
  map '/newspapers' do
    run Paperboy.new
  end
end

Rack::Handler::Thin.run rack_app, :Port => 9292
