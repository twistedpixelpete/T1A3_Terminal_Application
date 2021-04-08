
require 'byebug'
require 'tty-prompt'
require 'colorize'
require_relative './lib/activity'
require_relative './lib/interface'

whats_on = Activity.new
interface = Interface.new 
prompt = TTY::Prompt.new
favs = []



def today_menu(prompt, interface, whats_on, list, favs, main_menu) 

    interface.title_block("Lets find something fun to do today!")
    whats_on.melb_list_today

    chosen_activity = prompt.select("\nSelect an activity to find out more\n", whats_on.list.push({name: "--Go Back to Menu--", value: 11}))
    

      
    if  chosen_activity <= 10
        puts whats_on.today_activities[chosen_activity-1][:description]
        puts "#{chosen_activity}"
        puts

        option = prompt.select("What next?") do |menu|
            menu.choice "Add to favorites", 1
            menu.choice "Go Back", 2
            end
        
            if option == 1
                favs << whats_on.list[chosen_activity][:name]
                puts "Done!"

                option2 = prompt.select("") do |menu|
                    menu.choice "Go Back", 1
                    end
                    if option2 == 1
                        today_menu(prompt, interface, whats_on, list, favs, main_menu)
                    end

                
            else
                today_menu(prompt, interface, whats_on, list, favs, main_menu)
            end

        
        else
            
            puts "i'm here"         
    end
end
    
   



main_menu = true
    while  main_menu == true
        interface.welcome
         prompt.select("What would you like to do?") do |menu|
            menu.choice "Check out what's on today", -> { main_menu = false, today_menu(prompt, interface, whats_on, whats_on.list, favs, main_menu)} 
            menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(prompt, interface, whats_on) }
             menu.choice "Look at my favorites", -> { favorites_list(prompt, interface, whats_on) }
            menu.choice "Exit", -> { leave_app(interface) }    
            end  
    end   

 
 

 
#  weekend_menu == false
#     interface.title_block("What should we do on the weekend???")
#     prompt.select("What would you like to do?") do |menu|
#             menu.choice "Go back", -> { leave_section(prompt, interface, whats_on) }
       

  # p titles
    # whats_on.lists_today_activities
    
    # puts whats_on.today_titles



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
    # interface.welcome

    # main_menu(prompt, interface, whats_on)

    







    









