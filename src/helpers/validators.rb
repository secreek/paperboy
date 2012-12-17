# Validators in the application

# Mixin to Object class for clarity
class Object
  # validates if the request object is valid
  # it is a valid object when:
  #     1. it is a hash object
  #     2. it contains essential contents
  def is_valid_pb_work
    return false unless self.class == Hash

    self.each_pair do |key, value|
      # valids a single set of object against the protocol

      # The key should be a string & value should be a hash
      return false unless (value.class == Hash and key.class == String)

      return false unless (value["sender"] and value["recipients"] and value["message"])

      # Tests if the sender part is complete
      return false unless (value["sender"]["name"] and value["sender"]["uri"])

      # Tests if the recipients part is complete
      return false unless value["recipients"].class == Array
      recipients = value["recipients"]
      recipients.each do |recipient|
        return false unless (recipient.class == Hash and recipient["name"] and recipient["uri"])
      end

      # Tests if the message part is complete
      return false unless (value["message"]["title"] and value["message"]["body"])
    end

    return true
  end
end
