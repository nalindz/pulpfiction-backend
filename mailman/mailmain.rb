# mailman_app.rb
require 'mailman'
require 'textractor'
require 'net/http'
require 'uri'


Mailman.config.pop3 = {
  :username => 'pulpfictionapp@gmail.com',
  :password => 'thecatsaysmeow',
  :server   => 'pop.gmail.com',
  :port     => 995, # defaults to 110
  :ssl      => true # defaults to false
}


Mailman.config.poll_interval = 4

server_url = "http://0.0.0.0:3000/"
Mailman::Application.run do
  to '%username%+%hash%@pulpfictionapp.com' do |username, hash|
    message.attachments.each { |attachment|
      if  File.extname(attachment.filename) == ".txt"
        text = attachment.body.decoded
      elsif  File.extname(attachment.filename) == ".docx"
        File.delete(attachment.filename) if File.exists?(attachment.filename)
        File.open(attachment.filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
        text = Textractor.text_from_path(attachment.filename)
        text = text.gsub(/&quot;/, "'")
        File.delete(attachment.filename)
      end

      title = File.basename(attachment.filename, File.extname(attachment.filename))


      res = Net::HTTP.post_form(URI.parse("#{server_url}/stories"),
                                {title: title, username: username, email_hash: hash, text: text})
      puts res.body



#      Story.create_with_blocks(:title => File.basename(attachment.filename, 
#                                                       File.extname(attachment.filename)),
#                                                       :text => text,
#                                                       :user => user)
    }
  end
end
