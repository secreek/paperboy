require_relative '../helpers/mailer'
require_relative '../handler'

class EmailHandler
  # register the handler
  Handler.register('email', self)

  def self.send_message value
    value['recipients'].each do |recipient|
      recipient_name = recipient['name']
      recipient_uri = recipient['uri']

      Mailer.send(value['message']['body'],
        "#{value['sender']['name']} <#{value['sender']['uri']}>",
        "#{recipient_name} <#{recipient_uri}>")
    end
  end
end
