class Handler
  @@handlers = {}

  def self.register name, handler
    @@handlers[name] = handler
  end

  def self.can_handle? name
    @@handlers.has_key? name
  end

  def self.handle_it target, value
    handler = @@handlers[target]

    if handler.respond_to? :send_message
      handler.send_message value
    end
  end

  Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each do |handler|
      require handler
  end

end
