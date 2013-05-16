desc "pings the shit"
task :update_feed => :environment do
  puts 'pinging...'
  system("curl www.pulpfictionapp.com")
  puts 'done.'
end

