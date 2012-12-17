class BaseHandler
  attr_accessor :sender_name, :sender_uri
  attr_accessor :recipients
  attr_accessor :message_title, :message_body

  def handle_it value
    # before send, parse the essential information
    pre_process value

    # send the message via different channels according to different type
    # sub-classes MUST implement this method
    send_message

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
end
