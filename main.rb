
require 'byebug'
require 'tty-prompt'
require 'colorize'
require_relative './lib/activity'
require_relative './lib/interface'

whats_on = Activity.new
interface = Interface.new 
prompt = TTY::Prompt.new
favs = []
sorted_favs = []



def today_menu(prompt, interface, whats_on, list, favs, main_menu) 

    interface.title_block("Check out whats on today!")
    
    whats_on.melb_list_today

    chosen_activity = prompt.select("\nSelect an activity to find out more\n", whats_on.list.push({name: "--Go Back to Menu--", value: 11}).uniq)
    

      
    if  chosen_activity <= 10
        puts whats_on.today_activities[chosen_activity-1][:description]
        
        puts

        option = prompt.select("What next?") do |menu|
            menu.choice "Add to favorites", 1
            menu.choice "Go Back".blue, 2
            end
        
            if option == 1
                favs << whats_on.list[chosen_activity-1][:name]

                puts "Done!\n#{whats_on.list[chosen_activity-1][:name]} added to favorites!".light_green

                option2 = prompt.select("") do |menu|
                    menu.choice "Go Back".blue, 1
                    end
                    if option2 == 1
                        today_menu(prompt, interface, whats_on, list, favs, main_menu)
                    end

                
            else
                today_menu(prompt, interface, whats_on, list, favs, main_menu)
            end

        
        else                    
    end
end

def sort_favs(favs, sorted_favs)

    i=0
           while i < favs.length
               
              bob = {name: favs[i], value: i+1.to_i}

              sorted_favs << bob

                i += 1     
            end
    
end



def favorites_list(prompt, interface, whats_on, favs, sorted_favs)
    system 'clear'
    interface.title_block("My Favorites")
    if favs.length == 0
        puts "You have no favorites!"
    end
    favs.uniq
    puts favs
    sort_favs(favs, sorted_favs)
    puts sorted_favs

    chosen_activity = prompt.select("\nSelect to delete or EXIT to main menu\n", sorted_favs.push({name: "--Go Back to Menu--", value: 11}).uniq )



end
    
   



main_menu = true
    while  main_menu == true
        interface.welcome
         prompt.select("What would you like to do?") do |menu|
            menu.choice "Check out what's on today", -> {today_menu(prompt, interface, whats_on, whats_on.list, favs, main_menu)} 
            menu.choice "Check out things to do on the weekend", -> { melb_list_weekend(prompt, interface, whats_on) }
             menu.choice "Look at my favorites", -> { favorites_list(prompt, interface, whats_on, favs, sorted_favs) }
            menu.choice "Exit", -> { interface.leave_app }    
            end  
    end   

#  weekend_menu == false
#     interface.title_block("What should we do on the weekend???")
#     prompt.select("What would you like to do?") do |menu|
#             menu.choice "Go back", -> { leave_section(prompt, interface, whats_on) }
       

  # p titles
    # whats_on.lists_today_activities
    
    # puts whats_on.today_titles



def leave_section(prompt, interface, whats_on)
    interface.welcome
    main_menu(prompt, interface, whats_on)
    
end



#application loop


# interface.title_block("come on")
    # interface.welcome

    # main_menu(prompt, interface, whats_on)

    







    









