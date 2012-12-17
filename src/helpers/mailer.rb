require 'net/smtp'

class Mailer
  def self.send(msg, from, to)
    Net::SMTP.start('localhost') do |smtp|
      smtp.send_message(msg, from, to)
    end
  end
end
