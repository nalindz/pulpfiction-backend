# mailman_app.rb
require 'mailman'
require 'textractor'

Mailman.config.pop3 = {
  :username => 'bookapptest@gmail.com',
  :password => 'thecatsaysmeow',
  :server   => 'pop.gmail.com',
  :port     => 995, # defaults to 110
  :ssl      => true # defaults to false
}

Mailman.config.rails_root = '../'

Mailman.config.poll_interval = 4

Mailman::Application.run do
  to 'bookapptest@gmail.com' do
    message.attachments.each { |attachment|
      user = User.find_by_first_name("Nalin")
      if  File.extname(attachment.filename) == ".txt"
        text = attachment.body.decoded
      elsif  File.extname(attachment.filename) == ".docx"
        File.delete(attachment.filename) if File.exists?(attachment.filename)
        File.open(attachment.filename, "w+b", 0644) {|f| f.write attachment.body.decoded}
        text = Textractor.text_from_path(attachment.filename)
        text = text.gsub(/&quot;/, "'")
        File.delete(attachment.filename)
      end
      Story.create_with_blocks(:title => File.basename(attachment.filename, 
                                                       File.extname(attachment.filename)),
                                                       :text => text,
                                                       :user => user)
    }
  end
end
