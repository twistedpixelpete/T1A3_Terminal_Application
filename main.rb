
require 'byebug'
require 'tty-prompt'
require_relative './lib/melb'
require_relative './lib/interface'

whats_on = Melb.new
interface = Interface.new 
prompt = TTY::Prompt.new
app = true



def melb_list_today(interface, whats_on)
    interface.title_block("Lets find something fun to do today!")
    whats_on.lists_today_activities
end

def melb_list_weekend(interface)
    interface.title_block("What should we do on the weekend???")
end

def favorites_list(interface)
    interface.title_block("My Favorites")
end

def leave_app(interface)
    interface.title_block("See you next time")
    puts "Have a great day!"
    sleep(1)

    app = false
    exit!
    
end

#application loop



    interface.welcome
    
    sleep(0.6)
    prompt.select("What would you like to do?") do |menu|
       menu.choice "Check out what's on today", -> { melb_list_today(interface, whats_on)} 
       menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(interface) }
       menu.choice "Look at my favorites", -> { favorites_list(interface) }
       menu.choice "Exit", -> { leave_app(interface) }
     end 





    









