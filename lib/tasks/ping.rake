desc "pings the shit"
task :ping => :environment do
  puts 'pinging...'
  system("curl www.pulpfictionapp.com")
  puts 'done.'
end

