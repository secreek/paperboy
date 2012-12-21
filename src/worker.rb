require 'thread'
require_relative 'handler'

class Worker
  attr_accessor :job_queue

  def self.turn_on
    @job_queue ||= Queue.new

    4.times do
      Thread.new do
        loop do
          work = @job_queue.pop(false) # Blocking
          work.each do |key, value|
            if Handler.can_handle? key
              Handler.handle_it key, value
            end
          end
        end
      end
    end
  end

  def self.turn_off
    # Leave blank for now
  end

  def self.new_job request_object
    @job_queue ||= Queue.new
    @job_queue << request_object
  end
end
