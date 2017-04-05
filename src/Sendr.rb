require 'mail'

class Sendr
  def send(my_subject, receipient, html_path)

    Mail.defaults do
      delivery_method :smtp, { :address    => "smtp.gmail.com",
                              :port       => 587,
                              :user_name  => 'jessiewootenvisual@gmail.com',
                              :password   => 'TheColdestEver136',
                              :authentication => :plain,
                              :enable_starttls_auto => true
                            }
    end

    # Generate New eMail
    puts "[Sendr]: Making new email"

    mail = Mail.new do
      from 'Sendr <sendr@newscart.co>'
      to receipient
      subject my_subject
    end

    # Gather HTML part
    puts "[Sendr]: Making new html_part"
    html_part = Mail::Part.new do
      content_type 'text/html; charset=UTF-8'
      body File.read(html_path)
    end

    puts "[Sendr]: Binding html_part"
    mail.html_part = html_part

    puts "[Sendr]: Attempting to deliver email"
    mail.deliver!
  end
end
