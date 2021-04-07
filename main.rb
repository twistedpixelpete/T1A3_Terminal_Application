
require 'byebug'
require 'tty-prompt'
require 'colorize'
require_relative './lib/melb'
require_relative './lib/interface'

whats_on = Melb.new
interface = Interface.new 
prompt = TTY::Prompt.new

def main_menu(prompt, interface, whats_on)
    prompt.select("What would you like to do?") do |menu|
        menu.choice "Check out what's on today", -> { melb_list_today(prompt, interface, whats_on) } 
        menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(prompt, interface, whats_on) }
        menu.choice "Look at my favorites", -> { favorites_list(prompt, interface, whats_on) }
        menu.choice "Exit", -> { leave_app(interface) }    
end  
     end 

def today_menu(prompt, interface, whats_on)
    prompt.select("What would you like to do?") do |menu|
        menu.choice "Save to favorites", -> { melb_list_today(prompt, interface, whats_on) } 
        menu.choice "Go back", -> { melb_list_today(prompt, interface, whats_on) }
   
    end  
   
end



def melb_list_today(prompt, interface, whats_on)
    
    interface.title_block("Lets find something fun to do today!")
    whats_on.activity_display
    
    title = whats_on.list
#    puts title
    chosen_activity = prompt.select("Select an activity to find out more", title.push({name: "--Go Back to Menu--", value: 11}))

    case chosen_activity
    when 1
        puts whats_on.today_activities[0][:description]
        today_menu(prompt, interface, whats_on)
   
    when 2
        puts whats_on.today_activities[1][:description]
        today_menu(prompt, interface, whats_on)

    when 3 
        puts whats_on.today_activities[2][:description]
        today_menu(prompt, interface, whats_on)

    when 4 
        puts whats_on.today_activities[3][:description]
        today_menu(prompt, interface, whats_on)

    when 5
        puts whats_on.today_activities[4][:description]
        today_menu(prompt, interface, whats_on)

    when 6 
        puts whats_on.today_activities[5][:description]
        today_menu(prompt, interface, whats_on)

    when 7 
        puts whats_on.today_activities[6][:description]
        today_menu(prompt, interface, whats_on)

    when 8 
        puts whats_on.today_activities[7][:description]
        today_menu(prompt, interface, whats_on)
    when 9 
        puts whats_on.today_activities[8][:description]
        today_menu(prompt, interface, whats_on)

    when 10 
        puts whats_on.today_activities[9][:description]
        main_menu(prompt, interface, whats_on)

    when 11 
        interface.welcome
        main_menu(prompt, interface, whats_on)
        
    else 
        interface.welcome
        main_menu(prompt, interface, whats_on)
        
    end
  
end

  # p titles
    # whats_on.lists_today_activities
    
    # puts whats_on.today_titles

def melb_list_weekend(prompt, interface, whats_on)
    interface.title_block("What should we do on the weekend???")
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Go back", -> { leave_section(prompt, interface, whats_on) }
       
        end  

end

def favorites_list(prompt, interface, whats_on)
    interface.title_block("My Favorites")
    prompt.select("What would you like to do?") do |menu|
        menu.choice "Go back", -> { leave_section(prompt, interface, whats_on) }
   
    end  
    

end

def leave_section(prompt, interface, whats_on)
    interface.welcome
    main_menu(prompt, interface, whats_on)
    
end

def leave_app(interface)
    interface.title_block("See you next time")
    puts "Have a great day!".colorize(:color => :light_blue)
    print "3 ".colorize(:color => :light_green)
    sleep(1)
    print "2 ".colorize(:color => :yellow)
    sleep(1)
    print "1\n".colorize(:color => :light_red)
    sleep(1)
    system 'clear'

    app = false
    exit!
    
end

#application loop


# interface.title_block("come on")
    interface.welcome
    

    # sleep(0.2)

    main_menu(prompt, interface, whats_on)

    






    









