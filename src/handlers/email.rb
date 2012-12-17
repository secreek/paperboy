require_relative 'base'
require_relative '../helpers/mailer'

class EmailHandler < BaseHandler
  def send_message
    puts 'got here!!'

    @recipients.each do |recipient|
      recipient_name = recipient['name']
      recipient_uri = recipient['uri']

      Mailer.send(@message_body,
        "#{@sender_name} <#{@sender_uri}>",
        "#{recipient_name} <#{recipient_uri}>")
    end
  end
end
