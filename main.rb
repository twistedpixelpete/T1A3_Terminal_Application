
require_relative './lib/activity'
require 'tty-progressbar'
bar = TTY::ProgressBar.new("[:bar]", bar_format: :box, width: 60)


puts "Fetching your info...".center(60).blue
    20.times do
    sleep(0.1)
    bar.advance  
    end
   

whats_on = Activity.new("./data/favs.json")
whats_on.run





  
    
 




 




