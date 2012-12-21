require_relative '../helpers/mailer'

class Handler
  attr_accessor :sender_name, :sender_uri
  attr_accessor :recipients
  attr_accessor :message_title, :message_body

  def handle_it type, value
    # before send, parse the essential information
    pre_process value

    # using ghost method to process the values
    self.send(type, value)

    # post send hooks, not quite useful right now
    post_send
  end

  def pre_process value
    @sender_name = value['sender']['name']
    @sender_uri = value['sender']['uri']

    @recipients = value['recipients']

    @message_title = value['message']['title']
    @message_body = value['message']['body']
  end

  def post_send
    # does nothing here
  end

  # Methods for different types of request
  def handle_email
    @recipients.each do |recipient|
      recipient_name = recipient['name']
      recipient_uri = recipient['uri']

      Mailer.send(@message_body,
        "#{@sender_name} <#{@sender_uri}>",
        "#{recipient_name} <#{recipient_uri}>")
    end
  end

  # the type of request can not be processed
  def method_missing(name, *args)
    inner_method_name = "handle_#{name}"
    if self.respond_to? inner_method_name
      self.send(inner_method_name) # handle methods do not take arguments
    else
      # TODO send cannot handle it email
      puts "CANNOT handle #{name} type of request"
    end
  end
end
