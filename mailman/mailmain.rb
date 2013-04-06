# mailman_app.rb
require 'mailman'
require 'textractor'
require 'net/http'
require 'uri'
require 'rest_client'


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
    begin
    message.attachments.each { |attachment|
      if  File.extname(attachment.filename) == ".txt"
        @text = attachment.body.decoded
        @title = File.basename(attachment.filename, File.extname(attachment.filename)) if @title.nil?
      elsif  File.extname(attachment.filename) == ".docx"
        File.delete(attachment.filename) if File.exists?(attachment.filename)
        File.open(attachment.filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
        @text = Textractor.text_from_path(attachment.filename)
        @text = @text.gsub(/&quot;/, "'")
        File.delete(attachment.filename)
        @title = File.basename(attachment.filename, File.extname(attachment.filename)) if @title.nil?
      elsif  File.extname(attachment.filename) == ".jpg" ||
             File.extname(attachment.filename) == ".png" ||
             File.extname(attachment.filename) == ".jpeg"
        File.delete(attachment.filename) if File.exists?(attachment.filename)
        File.open(attachment.filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
        @cover_image = File.new(attachment.filename, 'rb')
      end
    }


      res = RestClient.post "#{server_url}/stories", {title: @title, 
                                                username: username, 
                                                email_hash: hash, 
                                                text: @text,
                                                cover_image: @cover_image }
      @title = nil
      @text = nil
      @cover_image = nil
      puts res
    rescue SignalException
      raise
    rescue Exception => e
      puts e
    end
  end
end
