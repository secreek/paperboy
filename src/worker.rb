require 'thread'
require './handlers/creator'

class Worker
  attr_accessor :job_queue

  def self.turn_on
    @job_queue ||= Queue.new
    Thread.new do
      while true
        puts @job_queue.empty?
        if not @job_queue.empty?
          work = @job_queue.pop(true) rescue nil
          if work
            # dispatches the work
            # TODO save the id to some database, CouchDB for example
            id = work[:job_id]
            json_obj = work[:material]
            json_obj.each do |key, value|
              handler = HandlerCreator.create_handler key
              handler.handle_it value if handler != nil
            end
          end
        else # check for new job every one second
          sleep 1
        end
      end
    end
  end

  def self.turn_off
    # Leave blank for now
  end

  def self.new_job request_json
    @job_queue ||= Queue.new
    @job_queue << request_json
  end
end
