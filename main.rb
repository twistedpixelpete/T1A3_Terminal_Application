
require_relative './lib/activity'
require 'tty-progressbar'
require 'net/ping'
include Net
bar = TTY::ProgressBar.new("[:bar]", bar_format: :box, width: 60)
header = "-"*60
header_length = header.length

connection = 'http://www.google.com/index.html'
p1 = Net::Ping::HTTP.new(connection)


if true && p1
    
    puts "Fetching your info...".center(60).blue
    20.times do
    sleep(0.1)
    bar.advance  
    end
    whats_on = Activity.new("./data/favs.json")
    whats_on.run
else 
    
    raise StandardError, "Looks like your not connected to the internet..maybe check that and try again!"
end







  
    
 




 




