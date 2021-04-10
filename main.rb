
require_relative './lib/activity'
require 'tty-progressbar'

bar = TTY::ProgressBar.new("[:bar]", bar_format: :box, width: 60)

 
if  ARGV.empty?
    puts "Here we go!!\n".center(60).blue
    20.times do
    sleep(0.1)
    bar.advance
    end 
    puts 
    whats_on = Activity.new("./data/favs.json")
    whats_on.run
else 
    whats_on = Activity.new("./data/favs.json")
    whats_on.run
end



    







  
    
 




 




