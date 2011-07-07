require 'rubygems'
require 'net/smtp'

eval File.read("smtp_tls.rb")
Net::SMTP.enable_tls() 

class Mailer
  def self.mail name, to, subject, msg
    msgstr = <<END_OF_MESSAGE
From: Digital Demokrati <martin@digitaldemokrati.se>
To: #{name} <#{to}>
Subject: #{subject}
Date: Sat, 23 Jun 2001 16:26:43 +0900
Message-Id: <unique.message.id.string@example.com>

#{msg}
END_OF_MESSAGE

    Net::SMTP.start( 'smtp.gmail.com',
                      587,
                      'digitaldemokrati.se',
                      'martin@digitaldemokrati.se',
                      'FKsea3#g7/f9]g3(^j2z',
                      :plain
    ) { |smtp| smtp.sendmail msgstr, "info@digitaldemokrati.se", to }
  end
end



__END__
require 'net/smtp'

class Mailer

  def self.send msg, to
    Net::SMTP.start 'smtp.gmail.com', 587, 'digitaldemokrati.se', "martin", "FKsea3#g7/f9]g3(^j2z", 'plain' do |smtp|
      puts "Our SMTP object send: #{smtp.inspect}"
      smtp.enable_starttls_auto
      smtp.send_message msg, "info@digitaldemokrati.se", to
    end
  end
  
  def self.sendr msg, to
    Net::SMTP.start 'smtp.gmail.com', 587, 'digitaldemokrati.se', "martin", "FKsea3#g7/f9]g3(^j2z", 'plain' do |smtp|
      smtp = Net::SMTP.new(smtp_settings[:address], smtp_settings[:port])
      puts "Our SMTP object in sendr: #{smtp.inspect}"
      smtp.enable_starttls_auto if smtp.respond_to?(:enable_starttls_auto)
      smtp.start(smtp_settings[:domain], smtp_settings[:user_name], smtp_settings[:password],
      smtp_settings[:authentication]) do |smtp|
        smtp.sendmail(msg, "info@digitaldemokrati.se", to)
      end
    end
  end

end