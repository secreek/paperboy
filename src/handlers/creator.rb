require_relative 'email'

class HandlerCreator
  def self.create_handler type
    return EmailHandler.new if type == "email"
    return nil
  end
end
