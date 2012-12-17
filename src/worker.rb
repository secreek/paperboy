require 'thread'

class Worker
  attr_accessor :job_queue

  def self.new_job request_json
    @job_queue ||= Queue.new
    @job_queue << request_json
  end
end
