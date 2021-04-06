
require 'byebug'
require 'tty-prompt'
require_relative './lib/melb'
require_relative './lib/interface'

whats_on = Melb.new
interface = Interface.new 
prompt = TTY::Prompt.new




def melb_list_today(interface, whats_on, prompt)
    interface.title_block("Lets find something fun to do today!")
    whats_on.activity_display
    
    title = whats_on.list
#    puts title
    chosen_activity = prompt.select("Select an activity to find out more", title.push({name: "Exit", value: 11}))

    case chosen_activity
    when 1
        puts whats_on.today_activities[0][:description]
        
    when 2
        puts whats_on.today_activities[1][:description]

    when 3 
        puts whats_on.today_activities[2][:description]
    when 4 
        puts whats_on.today_activities[3][:description]
    when 5
        puts whats_on.today_activities[4][:description]
    when 6 
        puts whats_on.today_activities[5][:description]
    when 7 
        puts whats_on.today_activities[6][:description]
    when 8 
        puts whats_on.today_activities[7][:description]
    when 9 
        puts whats_on.today_activities[8][:description]
    when 10 
        puts whats_on.today_activities[9][:description]
    when 11 
        interface.welcome
        
    else 
        interface.welcome
        
    end
  
end

  # p titles
    # whats_on.lists_today_activities
    
    # puts whats_on.today_titles

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
            menu.choice "Check out what's on today", -> { melb_list_today(interface, whats_on,prompt) } 
            menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(interface) }
            menu.choice "Look at my favorites", -> { favorites_list(interface) }
            menu.choice "Exit", -> { leave_app(interface) }
        
    
    
    
     end 





    









